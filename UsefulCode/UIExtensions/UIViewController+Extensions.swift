//
//  UIViewController+Extensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 11/09/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Add child viewController and attach it to view with given constraints
    func addAndAttachChild(_ viewController: UIViewController, with constraints: [NSLayoutConstraint]) {
        self.addChild(viewController)
        viewController.willMove(toParent: self)

        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(viewController.view)
        NSLayoutConstraint.activate(constraints)

        viewController.didMove(toParent: self)
    }
}
