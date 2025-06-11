//
//  LoadFeedFromCacheUseCaseTest.swift
//  EssentialFeedTests
//
//  Created by Bukhari Muslim on 14/05/25.
//

import XCTest
import EssentialFeed

class LoadFeedFromCacheUseCaseTest: XCTestCase {
    
    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSUT()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    func test_load_requestsCacheRetrieval() {
        let (sut, store) = makeSUT()
        
        sut.load { _ in}
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_failed_OnRetrievalError() {
        let (sut, store) = makeSUT()
        let retrievalError = anyNSError()
        
        expect(sut, toCompleteWith: .failure(retrievalError), when: {
            store.completeRetrieval(with: retrievalError)
        })
    }
    
    func test_load_deliverNoImagesOnEmptyCache() {
        let (sut, store) = makeSUT()
        
        expect(sut, toCompleteWith: .success([]), when: {
            store.completeRetrievalWithEmptyCache()
        })
    }
    
    func test_load_deliversCachedImageOnNonExpiredCache() {
        let feed = uniqueImageFeed()
        let fixCurrentDate = Date()
        let nonExpiredTimestamp = fixCurrentDate.minusFeedCacheMaxAge().adding(seconds: 1)
        let (sut, store) = makeSUT(currentDate: { fixCurrentDate })
        
        expect(sut, toCompleteWith: .success(feed.models), when: {
            store.completeRetrieval(with: feed.local, timestamp: nonExpiredTimestamp)
        })
    }
    
    func test_load_deliversNoImgaesOnCacheExpiration() {
        let feed = uniqueImageFeed()
        let fixCurrentDate = Date()
        let expirationTimestamp = fixCurrentDate.minusFeedCacheMaxAge()
        let (sut, store) = makeSUT(currentDate: { fixCurrentDate })
        
        expect(sut, toCompleteWith: .success([]), when: {
            store.completeRetrieval(with: feed.local, timestamp: expirationTimestamp)
        })
    }
    
    func test_load_deliversNoImgaesOnExpiredCache() {
        let feed = uniqueImageFeed()
        let fixCurrentDate = Date()
        let expiredTimestamp = fixCurrentDate.minusFeedCacheMaxAge().adding(seconds: -1)
        let (sut, store) = makeSUT(currentDate: { fixCurrentDate })
        
        expect(sut, toCompleteWith: .success([]), when: {
            store.completeRetrieval(with: feed.local, timestamp: expiredTimestamp)
        })
    }
    
    func test_load_hasNoSideEffectsOnRetrievalError() {
        let (sut, store) = makeSUT()
        store.completeRetrieval(with: anyNSError())
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_hasNoSideEffectsOnEmptyCache() {
        let (sut, store) = makeSUT()
        store.completeRetrievalWithEmptyCache()
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_hasNoSideEffectsOnNonExpiredCache() {
        let feed = uniqueImageFeed()
        let fixCurrentDate = Date()
        let nonExpiredTimestamp = fixCurrentDate.minusFeedCacheMaxAge().adding(seconds: 1)
        let (sut, store) = makeSUT(currentDate: { fixCurrentDate })
        store.completeRetrieval(with: feed.local, timestamp: nonExpiredTimestamp)
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_hasNoSideEffectOnCacheExpiration() {
        let feed = uniqueImageFeed()
        let fixCurrentDate = Date()
        let expirationTimestamp = fixCurrentDate.minusFeedCacheMaxAge()
        let (sut, store) = makeSUT(currentDate: { fixCurrentDate })
        store.completeRetrieval(with: feed.local, timestamp: expirationTimestamp)
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    func test_load_hasNoSideEffectOnExpiredCache() {
        let feed = uniqueImageFeed()
        let fixCurrentDate = Date()
        let expiredTimestamp = fixCurrentDate.minusFeedCacheMaxAge().adding(seconds: -1)
        let (sut, store) = makeSUT(currentDate: { fixCurrentDate })
        store.completeRetrieval(with: feed.local, timestamp: expiredTimestamp)
        
        sut.load { _ in }
        
        XCTAssertEqual(store.receivedMessages, [.retrieve])
    }
    
    // MARK : - Helpers
    
    private func makeSUT(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    private func expect(_ sut: LocalFeedLoader, toCompleteWith expectedResult: LocalFeedLoader.LoadResult, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        let exp = expectation(description: "Wait for load complation")
        action()
        
        sut.load { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedImages), .success(expectedImages)):
                XCTAssertEqual(receivedImages, expectedImages, file: file, line: line)
            case let (.failure(receivedError as NSError), .failure(expectedError as NSError)):
                XCTAssertEqual(receivedError, expectedError, file: file, line: line)
            default:
                XCTFail("Expected result \(expectedResult), got \(receivedResult) instead", file: file, line: line)
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1.0)
    }
}
