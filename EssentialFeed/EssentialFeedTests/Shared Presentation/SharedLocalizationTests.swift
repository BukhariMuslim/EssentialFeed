//
//  SharedLocalizationTests.swift
//  EssentialFeedTests
//
//  Created by Bukhari Muslim on 04/06/25.
//

import XCTest
import EssentialFeed

class SharedLocalizationTests: XCTestCase {
    
    func test_localizedStrings_havKeysAndValuesForAllSupportedLocalizations() {
        let table = "Shared"
        let bundle = Bundle(for: LoadResourcePresenter<Any, DummyView>.self)
        
        assertLocalizedKeyAndValuesExist(in: bundle, table)
    }
    
    // MARK: - Helpers
    
    private class DummyView: ResourceView {
        func display(_ viewModel: Any) {}
    }
}
