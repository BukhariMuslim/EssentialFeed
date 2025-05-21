//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Bukhari Muslim on 22/05/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
