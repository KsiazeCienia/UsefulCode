//
//  UICollectionViewExtensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 12/04/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

extension UICollectionView {

    /// Easier cell register
    func register(_ type: UICollectionViewCell.Type) {
        register(type, forCellWithReuseIdentifier: type.identifier)
    }

    /// Unsafe cell dequeue with cast to given class
    func unsafeDequeueReusableCell<T: UICollectionViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.identifier,
                                             for: indexPath) as? T else {
                                                fatalError("Could not dequeue cell with identifier: \(cellType.identifier)")
        }
        return cell
    }

    /// Easier resuable view register
    func registerHeader(_ type: UICollectionReusableView.Type) {
        register(type, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.identifier)
    }

    /// Unsafe reusable view dequeue with cast to given class
    func unsafeDequeueReusableHeaderView<T: UICollectionReusableView>(_ viewType: T.Type, for indexPath: IndexPath) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: viewType.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(viewType.identifier)")
        }
        return view
    }
}
