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
        let view = ViewSpy()
        
        _ = FeedPresenter(view: view)
        
        XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
    }
    
    // MARK: - Helpers
    
    private class ViewSpy {
        let messages = [Any]()
    }
    
}
