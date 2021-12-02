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

    public var progressCallback: ((_ progress: Double, _ iterator: Int, _ total: Int) -> Void)?
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
            .downloadProgress { [weak self] progress in
                guard let self = self else {
                    return
                }
                self.progressCallback?(progress.fractionCompleted, self.iterator, self.total)
            }
            .publishData()
            .map { [weak self] response in
                self?.iterator += 1
                return response.value
            }
            .compactMap { $0 }
            .compactMap { UIImage(data: $0) }
            .map { [weak self] image in
                self?.cacheFunction?(image, resource.key)
                return true
//                return CacheImageSyncResponse(request: resource, image: image)
            }
            .replaceError(with: false)
            .eraseToAnyPublisher()
    }

    public func fetchImages(resources: [CacheImageSyncRequest]) -> AnyPublisher<Bool, Never> {
        iterator = 1
        total = resources.count
        return Publishers.Sequence(sequence: resources.map(fetchImage(resource:)))
            .flatMap(maxPublishers: .max(1)) { $0 }
            .map { $0 != nil }
            .eraseToAnyPublisher()
    }
}
