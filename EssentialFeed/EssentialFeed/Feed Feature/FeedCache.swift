//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 28/05/25.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
