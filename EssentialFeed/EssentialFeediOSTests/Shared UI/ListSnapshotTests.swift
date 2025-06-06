//
//  ListSnapshotTests.swift
//  EssentialFeediOSTests
//
//  Created by Bukhari Muslim on 06/06/25.
//

import XCTest
import EssentialFeediOS
@testable import EssentialFeed

class ListSnapshotTests: XCTestCase {
    
    func test_emptyList() {
            let sut = makeSUT()

            sut.display(emptyList())

            assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "EMPTY_LIST_light")
            assert(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "EMPTY_LIST_dark")
        }

        func test_listWithErrorMessage() {
            let sut = makeSUT()

            sut.display(.error(message: "This is a\nmulti-line\nerror message"))

            assert(snapshot: sut.snapshot(for: .iPhone(style: .light)), named: "LIST_WITH_ERROR_MESSAGE_light")
            assert(snapshot: sut.snapshot(for: .iPhone(style: .dark)), named: "LIST_WITH_ERROR_MESSAGE_dark")
        }

        // MARK: - Helpers

        private func makeSUT() -> ListViewController {
            let bundle = Bundle(for: ListViewController.self)
            let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
            let controller = storyboard.instantiateInitialViewController() as! ListViewController
            controller.loadViewIfNeeded()
            controller.tableView.showsVerticalScrollIndicator = false
            controller.tableView.showsHorizontalScrollIndicator = false
            return controller
        }

        private func emptyList() -> [CellController] {
            return []
        }
}
