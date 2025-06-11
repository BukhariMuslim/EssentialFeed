//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 14/05/25.
//

import Foundation

public typealias CachedFeed = (feed: [LocalFeedImage], timestamp: Date)

public protocol FeedStore {
    func deleteCachedFeed() throws
    func insert(_ feed: [LocalFeedImage], timestamp: Date) throws
    func retrieve() throws -> CachedFeed?
}
