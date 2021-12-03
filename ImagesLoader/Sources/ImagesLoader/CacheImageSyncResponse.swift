//
//  CacheImageSyncResponse.swift
//  
//
//  Created by Sergey Petrachkov on 03/12/2021.
//

import Foundation
import UIKit

public struct CacheImageSyncResponse: Equatable, Hashable {
    public let request: CacheImageSyncRequest
    public let image: UIImage
}
