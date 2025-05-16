//
//  CoreDataFeedStore.swift
//  EssentialFeed
//
//  Created by Bukhari Muslim on 16/05/25.
//

import Foundation

public final class CoreDataFeedStore: FeedStore {
    public init() {}
    
    public func retrieve(completion: @escaping RetrievalCompletion) {
        completion(.empty)
    }
    
    public func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
        
    }
    
    public func deleteCacheFeed(completion: @escaping DeletionCompletion) {
        
    }
    
}
