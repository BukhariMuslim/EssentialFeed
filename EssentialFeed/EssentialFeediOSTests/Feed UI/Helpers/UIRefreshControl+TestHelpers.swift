//
//  UIRefreshControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Bukhari Muslim on 22/05/25.
//

import UIKit

extension UIRefreshControl {
    func simulatePullToRefresh() {
        simulate(event: .valueChanged)
    }
}
