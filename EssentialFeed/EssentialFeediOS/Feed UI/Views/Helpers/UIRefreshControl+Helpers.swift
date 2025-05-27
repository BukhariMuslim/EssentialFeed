//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Bukhari Muslim on 27/05/25.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
