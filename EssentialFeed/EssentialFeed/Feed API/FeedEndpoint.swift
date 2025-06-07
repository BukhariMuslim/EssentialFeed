//
//  FeedEndpoint.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 06/06/25.
//

import Foundation

public enum FeedEndpoint {
    case get
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
