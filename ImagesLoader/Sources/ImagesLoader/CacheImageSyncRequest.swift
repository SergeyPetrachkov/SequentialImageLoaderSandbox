//
//  CacheImageSyncRequest.swift
//  
//
//  Created by Sergey Petrachkov on 03/12/2021.
//

import Foundation

public struct CacheImageSyncRequest: Equatable, Hashable {
    public init(key: String, url: URL) {
        self.key = key
        self.url = url
    }

    public let key: String
    public let url: URL
}
