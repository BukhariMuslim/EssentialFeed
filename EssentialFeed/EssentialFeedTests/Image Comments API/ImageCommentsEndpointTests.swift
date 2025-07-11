//
//  ImageCommentsEndpointTests.swift
//  EssentialFeedTests
//
//  Created by Bukhari Muslim on 06/06/25.
//

import XCTest
import EssentialFeed

class ImageCommentsEndpointTests: XCTestCase {
    
    func test_feed_endpointURL() {
        let imageID = UUID(uuidString: "2239CBA2-CB35-4392-ADC0-24A37D38E010")!
        let baseURL = URL(string: "http://base-url.com")!
        
        let received = ImageCommentsEndpoint.get(imageID).url(baseURL: baseURL)
        let expected = URL(string: "http://base-url.com/v1/image/2239CBA2-CB35-4392-ADC0-24A37D38E010/comments")!
        
        XCTAssertEqual(received, expected)
    }
}
