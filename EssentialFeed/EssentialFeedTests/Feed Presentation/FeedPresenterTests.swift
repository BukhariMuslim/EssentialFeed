//
//  FeedPresenterTests.swift
//  EssentialFeedTests
//
//  Created by Bukhari Muslim on 27/05/25.
//

import XCTest

private class FeedPresenter {
    init(view: Any) {
        
    }
}

class FeedPresenterTests: XCTestCase {
    
    func test_init_dosNotSendMessagesToView() throws {
        let (_, view) = try makeSUT()
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) throws -> (sut: FeedPresenter, view: ViewSpy) {
        let view = ViewSpy()
        let sut = FeedPresenter(view: view)
        trackForMemoryLeaks(view, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return(sut, view)
    }
    
    private class ViewSpy {
        let messages = [Any]()
    }
    
}
