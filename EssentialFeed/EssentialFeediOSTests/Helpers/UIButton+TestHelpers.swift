//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Bukhari Muslim on 22/05/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach({
                (target as NSObject).perform(Selector($0))
            })
        }
    }
}
