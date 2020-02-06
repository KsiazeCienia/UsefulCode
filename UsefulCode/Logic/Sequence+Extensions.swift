//
//  Sequence+Extensions.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 27/10/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import Foundation

extension Sequence {
    func all(matching predicate: (Element) -> Bool) -> Bool {
        return !contains(where: { !predicate($0) })
    }

    func filterMatching<T>(to array: [T], where predicate: (Element, T) -> Bool) -> [Element] {
        var resultArray: [Element] = []
        for element in self {
            guard let _ = array.first(where: { predicate(element, $0) }) else {
                continue
            }
            resultArray.append(element)
        }
        return resultArray
    }
}
