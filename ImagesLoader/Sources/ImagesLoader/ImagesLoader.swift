import Foundation
import Combine
import UIKit

public final class SyncImagesLoader {

    private let session: URLSession

    /// We need pre-configured session to load images
    public init(session: URLSession) {
        self.session = session
    }

    /// Load image using Combine. Provides publisher with image and original cache request.
    public func fetchImage(resource: CacheImageSyncRequest) -> AnyPublisher<CacheImageSyncResponse?, Never> {
        let request = request(for: resource)

        return session.dataTaskPublisher(for: request)
            .map { $0.data }
            .map { data in
                if let image = UIImage(data: data) {
                    return CacheImageSyncResponse(request: resource, image: image)
                }
                return nil
            }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }

    /// Load image using async await. It's a throwing function.
    @available(iOS 15.0.0, *)
    public func fetchImage(resource: CacheImageSyncRequest) async throws -> CacheImageSyncResponse? {
        let request = request(for: resource)
        let imageData = try await URLSession.shared.data(for: request).0
        if let image = UIImage(data: imageData) {
            return CacheImageSyncResponse(request: resource, image: image)
        }
        return nil
    }

    /// This is an oldschool pseudo sync loading that uses DispatchGroup. You need to call this outside the main queue.
    public func unsafeLoadImage(resource: CacheImageSyncRequest) -> CacheImageSyncResponse? {
        let dispatchGroup = DispatchGroup()
        let request = request(for: resource)
        var result: CacheImageSyncResponse?
        dispatchGroup.enter()
        URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
            if let data = data,
               let image = UIImage(data: data) {
                result = CacheImageSyncResponse(request: resource, image: image)
            } else {
                result = nil
            }
            dispatchGroup.leave()
        }).resume()
        _ = dispatchGroup.wait(timeout: .now() + 21)
        return result
    }
}

public extension SyncImagesLoader {
    /// Convenience method to load multiple images sequentially and give progress callback.
    func fetchImages(resources: [CacheImageSyncRequest],
                     progressCallback: ((_ iterator: Int, _ total: Int) -> Void)?) -> AnyPublisher<CacheImageSyncResponse?, Never> {
        var iterator = 1
        let total = resources.count
        return Publishers
            .Sequence(sequence: resources.map(fetchImage(resource:)))
            .flatMap(maxPublishers: .max(1)) { result -> AnyPublisher<CacheImageSyncResponse?, Never> in
                progressCallback?(iterator, total)
                iterator += 1
                return result
            }
            .eraseToAnyPublisher()
    }
}

private extension SyncImagesLoader {
    func request(for resource: CacheImageSyncRequest) -> URLRequest {
        var request = URLRequest(url: resource.url)
        request.timeoutInterval = 20
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return request
    }
}
