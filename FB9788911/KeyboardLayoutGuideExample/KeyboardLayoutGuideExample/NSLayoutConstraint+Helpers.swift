//
//  NSLayoutConstraint+Helpers.swift
//  KeyboardLayoutGuideExample
//
//  Created by Simon on 30/11/2021.
//

import UIKit

extension NSLayoutConstraint {
    @discardableResult
    func sbs_setPriority(_ priority: UILayoutPriority) -> Self {
        self.priority = priority
        return self
    }
}
