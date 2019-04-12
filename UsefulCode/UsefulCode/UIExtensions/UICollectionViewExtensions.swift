//
//  UICollectionViewExtensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 12/04/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

extension UICollectionView {

    // Easier cell register
    func register(_ type: UICollectionViewCell.Type) {
        register(type, forCellWithReuseIdentifier: type.identifier)
    }

    // Easier cell dequeue
    func dequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier,
                                             for: indexPath) as? T else {
                                                fatalError("Could not dequeue cell with identifier: \(cellType.identifier)")
        }
        return cell
    }
}
