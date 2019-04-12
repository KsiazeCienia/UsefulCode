//
//  UICollectionViewCellExtensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 12/04/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

extension UICollectionViewCell {

    // Identifier for cell
    static var identifier: String {
        return String(describing: self)
    }
}
