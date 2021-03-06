//
//  LoaderVC.swift
//  LoaderSandbox
//
//  Created by Sergey Petrachkov on 03/12/2021.
//

import Foundation
import Combine
import ImagesLoader
import UIKit

final class LoaderVC: UIViewController {
    private var disposableBag = Set<AnyCancellable>()
    private let loader = SyncImagesLoader(session: URLSession.shared)
    private let images = [
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/130.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/230.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/300.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/1234.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/2000.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://via.placeholder.com/3999.png")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://i.pinimg.com/originals/41/9c/e0/419ce0d1dcdeee9b41436a10288cd709.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://pixabay.com/get/g249565b858e1ff8b283ca3f307eab145ee41f862cb5998f9f43bcfc5769a173d0b835b90f19b558c94e42606a23735a7_1280.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "https://wallpaperaccess.com/full/1369012.jpg")!),
        CacheImageSyncRequest(key: UUID().uuidString, url: URL(string: "http://eskipaper.com/images/large-2.jpg")!),
    ]

    // MARK: - UI props

    lazy var combineLoadButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.setTitle("Combine load", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()

    lazy var asyncAwaitLoadButton: UIButton = {

        let button = UIButton(configuration: .filled())
        button.setTitle("Async await load", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()

    lazy var unsafeDispatchGroupLoadButton: UIButton = {

        let button = UIButton(configuration: .filled())
        button.setTitle("Old-school load", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()

    lazy var unsafeGreedyDispatchGroupLoadButton: UIButton = {

        let button = UIButton(configuration: .filled())
        button.setTitle("Old-school greedy load", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()

    lazy var label: UILabel = {

        let button = UILabel(frame: .zero)
        self.view.addSubview(button)
        button.textAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        return button
    }()

    lazy var stack: UIStackView = {
        let stack = UIStackView(
            arrangedSubviews: [
                self.combineLoadButton,
                self.asyncAwaitLoadButton,
                self.unsafeDispatchGroupLoadButton,
                self.unsafeGreedyDispatchGroupLoadButton
            ]
        )
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        label.text = "Loading status."
        combineLoadButton.addTarget(self, action: #selector(self.combineLoad), for: .touchUpInside)
        asyncAwaitLoadButton.addTarget(self, action: #selector(self.asyncAwaitLoad), for: .touchUpInside)
        unsafeDispatchGroupLoadButton.addTarget(self, action: #selector(self.oldschoolLoad), for: .touchUpInside)
        unsafeGreedyDispatchGroupLoadButton.addTarget(self, action: #selector(self.noAutoreleasepoolLoad), for: .touchUpInside)
        view.addSubview(stack)
        stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }

    deinit {
        print("\(self) deinit")
        disposableBag.forEach { $0.cancel() }
    }

    // MARK: - Actions

    @objc
    private func combineLoad() {
        loader
            .fetchImages(resources: images, progressCallback: { [weak self] current, total in
                DispatchQueue.main.async {
                    self?.label.text = "Loading \(current) of \(total)"
                }
            })
            .sink(receiveCompletion: { [weak self] _ in
                print("It's over")
                DispatchQueue.main.async {
                    self?.label.text = "Combine load is over"
                }
            }, receiveValue: { result in
                print("sink --> \(String(describing: result))")
            })
            .store(in: &disposableBag)
    }

    @objc
    private func asyncAwaitLoad() {
        Task {
            let total = images.count
            var current = 1
            for resource in images {
                self.label.text = "Loading \(current) of \(total)"
                let image = try? await loader.fetchImage(resource: resource)?.image
                print("\(current) of \(total) cache \(String(describing: image)) with \(resource.key)")
                current += 1
            }
            self.label.text = "Async await load is over"
        }
    }

    @objc
    private func oldschoolLoad() {
        DispatchQueue(label: "Images loader").async {
            let total = self.images.count
            var current = 1
            for resource in self.images {
                autoreleasepool {
                    DispatchQueue.main.async {
                        self.label.text = "Loading \(current) of \(total)"
                    }

                    let image = self.loader.unsafeLoadImage(resource: resource)
                    print("\(current) of \(total) cache \(String(describing: image)) with \(resource.key)")
                    current += 1
                }
                DispatchQueue.main.async {
                    self.label.text = "Oldschool with autoreleasepool load is over"
                }
            }
        }
    }

    @objc
    private func noAutoreleasepoolLoad() {
        DispatchQueue(label: "Images loader").async {
            let total = self.images.count
            var current = 1
            for resource in self.images {
                DispatchQueue.main.async {
                    self.label.text = "Loading \(current) of \(total)"
                }

                let image = self.loader.unsafeLoadImage(resource: resource)
                print("\(current) of \(total) cache \(String(describing: image)) with \(resource.key)")
                current += 1
                DispatchQueue.main.async {
                    self.label.text = "No autoreleasepool load is over"
                }
            }
        }
    }
}

