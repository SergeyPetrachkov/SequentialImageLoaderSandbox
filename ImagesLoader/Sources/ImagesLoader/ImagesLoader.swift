import Foundation
import Combine
import UIKit

@available(iOS 13.0, *)
public final class SyncImagesLoader {

    public var progressCallback: ((_ iterator: Int, _ total: Int) -> Void)?
    public var cacheFunction: ((UIImage, String) -> Void)?

    private var iterator: Int = 0
    private var total: Int = 0

    private let session: URLSession

    public init(session: URLSession) {
        self.session = session
    }

    #if targetEnvironment(simulator)
    deinit {
        print("\(self) deinit")
    }
    #endif

    public func fetchImage(resource: CacheImageSyncRequest) -> AnyPublisher<CacheImageSyncResponse?, Never> {
        var request = URLRequest(url: resource.url)
        request.timeoutInterval = 20
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        return session.dataTaskPublisher(for: request)
            .map { $0.data }
            .compactMap { $0 }
            .compactMap { UIImage(data: $0) }
            .map { [weak self] image in
                self?.iterator += 1
                self?.progressCallback?(self?.iterator ?? 1, self?.total ?? 1)
                self?.cacheFunction?(image, resource.key)
                return CacheImageSyncResponse(request: resource, image: image)
            }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }

    public func fetchImages(resources: [CacheImageSyncRequest]) -> AnyPublisher<CacheImageSyncResponse?, Never> {
        iterator = 1
        total = resources.count
        return Publishers.Sequence(sequence: resources.map(fetchImage(resource:)))
            .flatMap(maxPublishers: .max(1)) { $0 }
            .eraseToAnyPublisher()
    }

    @available(iOS 15.0.0, *)
    public func fetchImage(resource: CacheImageSyncRequest) async throws -> CacheImageSyncResponse? {
        var request = URLRequest(url: resource.url)
        request.timeoutInterval = 20
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let imageData = try await URLSession.shared.data(for: request).0
        if let image = UIImage(data: imageData) {
            return CacheImageSyncResponse(request: resource, image: image)
        }
        return nil
    }

    /// This is an oldschool pseudo sync loading that uses DispatchGroup. You need to call this outside the main queue.
    public func unsafeLoadImage(resource: CacheImageSyncRequest) -> CacheImageSyncResponse? {
        let dispatchGroup = DispatchGroup()
        var request = URLRequest(url: resource.url)
        request.timeoutInterval = 20
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
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
