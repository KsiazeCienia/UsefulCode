//
//  UIViewExtensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 12/04/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

extension UIView {

    // String description of class
    static var identifier: String {
        return String(describing: self)
    }

    // Add subview with edges constraints.
    // Possible to add offset
    func addSubviewWithEdgesConstraints(_ subview: UIView, offset: CGFloat = 0) {
        addSubview(subview)
        NSLayoutConstraint.activate([
            subview.topAnchor.constraint(equalTo: topAnchor, constant: offset),
            subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -offset),
            subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -offset),
            subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: offset)
        ])
    }
}
