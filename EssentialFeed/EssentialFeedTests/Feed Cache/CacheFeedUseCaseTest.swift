//
//  CacheFeedUseCaseTest.swift
//  EssentialFeedTests
//
//  Created by Bukhari Muslim on 12/05/25.
//

import XCTest
@testable import EssentialFeed

class LocalFeedLoader {
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deleteCacheFeedCallCount = 0
}

class CacheFeedUseCaseTest: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCacheFeedCallCount, 0)
    }
}
