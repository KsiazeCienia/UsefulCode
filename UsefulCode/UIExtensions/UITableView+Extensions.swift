//
//  UITableView+Extensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 14/08/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

extension UITableView {

    /// Easier cell register
    func register(_ type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.identifier)
    }

    /// Unsafe cell dequeue with cast to given class
    func unsafeDequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.identifier,
                                             for: indexPath) as? T else {
                                                fatalError("Could not dequeue cell with identifier: \(cellType.identifier)")
        }
        return cell
    }
}
