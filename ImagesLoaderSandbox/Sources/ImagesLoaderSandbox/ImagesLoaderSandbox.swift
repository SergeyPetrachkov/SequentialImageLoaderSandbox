public struct ImagesLoaderSandbox {
    public private(set) var text = "Hello, World!"

    public init() {
    }
}

import Foundation
import Combine
import Alamofire
import UIKit

public struct CacheImageSyncRequest: Equatable, Hashable {
    public init(key: String, url: URL) {
        self.key = key
        self.url = url
    }

    public let key: String
    public let url: URL
}

public struct CacheImageSyncResponse: Equatable, Hashable {
    public let request: CacheImageSyncRequest
    public let image: UIImage
}

@available(iOS 13.0, *)
public final class SyncImagesLoader {

    public var progressCallback: ((_ iterator: Int, _ total: Int) -> Void)?
    public var cacheFunction: ((UIImage, String) -> Void)?
    var iterator: Int = 0
    var total: Int = 0

    public init() {
        
    }

    deinit {
        print("\(self) deinit")
    }

    public func fetchImage(resource: CacheImageSyncRequest) -> AnyPublisher<Bool, Never> {
        var request = URLRequest(url: resource.url)
        request.timeoutInterval = 20

        return AF.download(request)
            .publishData()
            .map { [weak self] response in
                self?.iterator += 1
                return response.value
            }
            .compactMap { $0 }
            .compactMap { UIImage(data: $0) }
            .map { [weak self] image in
                self?.progressCallback?(self?.iterator ?? 1, self?.total ?? 1)
                self?.cacheFunction?(image, resource.key)
                return true
            }
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }

    public func fetchImages(resources: [CacheImageSyncRequest]) -> AnyPublisher<Bool, Never> {
        iterator = 1
        total = resources.count
        return Publishers.Sequence(sequence: resources.map(fetchImage(resource:)))
            .flatMap(maxPublishers: .max(1)) { $0 }
            .eraseToAnyPublisher()
    }

    @available(iOS 15.0.0, *)
    public func loadImage(resource: CacheImageSyncRequest) async throws -> UIImage? {
        var request = URLRequest(url: resource.url)
        request.timeoutInterval = 20
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        let imageData = try await URLSession.shared.data(for: request).0
        return UIImage(data: imageData)
    }

    public func unsafeLoadImage(resource: CacheImageSyncRequest) -> UIImage? {
        let dispatchGroup = DispatchGroup()
        var request = URLRequest(url: resource.url)
        request.timeoutInterval = 20
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        var result: UIImage?
        dispatchGroup.enter()
        URLSession.shared.dataTask(with: request, completionHandler: { data, _, error in
            if let data = data {
                result = UIImage(data: data)
            } else {
                result = nil
            }
            dispatchGroup.leave()
        }).resume()
        _ = dispatchGroup.wait(timeout: .now() + 21)
        return result
    }
}
