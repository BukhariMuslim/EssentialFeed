//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 28/05/25.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
