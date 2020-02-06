//
//  UIStackView+Extensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 15/10/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

extension UIStackView {

    /// Add arranged array of subviews
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach(addArrangedSubview)
    }
}
