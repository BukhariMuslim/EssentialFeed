//
//  CacheFeedImageDataUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Bukhari Muslim on 28/05/25.
//

import XCTest
import EssentialFeed

class CacheFeedImageDataUseCaseTests: XCTestCase {
    
    func test_init_doesNotMessageStoreUponCreation() throws {
        let (_, store) = try makeSUT()
        
        XCTAssertTrue(store.receivedMessages.isEmpty)
    }
    
    func test_saveImageDataForURL_requestsImageDataInsertionForURL() throws {
        let (sut, store) = try makeSUT()
        let url = anyURL()
        let data = anyData()
        
        try sut.save(data, for: url)
        
        XCTAssertEqual(store.receivedMessages, [.insert(data: data, for: url)])
    }
    
    func test_saveImageDataFromURL_failsOnStoreInsertionError() throws {
        let (sut, store) = try makeSUT()
        
        expect(sut, toCompleteWith: failed(), when: {
            let insertionError = anyNSError()
            store.completeInsertion(with: insertionError)
        })
    }
    
    func test_saveImageDataFromURL_succeedsOnSuccessfulStoreInsertion() throws {
        let (sut, store) = try makeSUT()
        
        expect(sut, toCompleteWith: .success(()), when: {
            store.completeInsertionSuccessfully()
        })
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) throws -> (sut: LocalFeedImageDataLoader, store: FeedImageDataStoreSpy) {
        let store = FeedImageDataStoreSpy()
        let sut = LocalFeedImageDataLoader(store: store)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, store)
    }
    
    private func failed() -> Result<Void, Error> {
        return .failure(LocalFeedImageDataLoader.SaveError.failed)
    }
    
    private func expect(_ sut: LocalFeedImageDataLoader, toCompleteWith expectedResult: Result<Void, Error>, when action: () -> Void, file: StaticString = #filePath, line: UInt = #line) {
        action()
        
        let receivedResult = Result { try sut.save(anyData(), for: anyURL()) }
        
        switch (receivedResult, expectedResult) {
        case (.success, .success):
            break
            
        case (.failure(let receivedError as LocalFeedImageDataLoader.SaveError),
              .failure(let expectedError as LocalFeedImageDataLoader.SaveError)):
            XCTAssertEqual(receivedError, expectedError, file: file, line: line)
            
        default:
            XCTFail("Expected result \(expectedResult), got \(receivedResult) instead", file: file, line: line)
        }
    }
}
