//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Bukhari Muslim on 22/05/25.
//

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
