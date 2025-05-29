//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Bukhari Muslim on 29/05/25.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.main.run(until: Date())
    }
}
