//
//  AdjustableCollectionViewFlowLayout.swift
//  UsefulCode
//
//  Created by Marcin Włoczko on 08/05/2019.
//  Copyright © 2019 Marcin Włoczko. All rights reserved.
//

import UIKit

/// CollectionViewFlowLayout that fit cells to UICollectionView size based on number of cells per row/column and given ratio
public final class AdjustableCollectionViewFlowLayout: UICollectionViewFlowLayout {

    // MARK: - Structures

    /// Defines dimension for to adjusting cells
    public enum DependencyMode {
        case row
        case column
    }

    /// Defines cells ratio
    public enum SizeMode {
        case square
        /// Ratio = width / height
        case rectangle(ratio: CGFloat)
    }

    // MARK: - Publics

    public var spacing: CGFloat = 5

    // MARK: - Privates

    private let numberOfItemsPerLine: Int
    private let dependecyMode: DependencyMode
    private let sizeMode: SizeMode
    private var isItemsSizeSet: Bool

    // MARK: - Initializer

    /// Returns an layout with cells size based on number of items per row/column and cell's width to height ratio
    public init(numberOfItems: Int, per dependencyMode: DependencyMode, sizeMode: SizeMode = .square) {
        self.numberOfItemsPerLine = numberOfItems
        self.dependecyMode = dependencyMode
        self.sizeMode = sizeMode
        self.isItemsSizeSet = false
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout's life cycle

    override public func prepare() {
        super.prepare()
        setupLayout()
    }

    // MARK: - Item size setup

    private func setupLayout() {
        let size = dependecyMode == .row ? sizeForRowDependency() : sizeForColumnDependency()
        guard let itemSize = size else { return }

        self.itemSize = itemSize
        minimumLineSpacing = spacing
        minimumInteritemSpacing = spacing
        sectionInset = UIEdgeInsets(top: spacing, left: spacing,
                                    bottom: spacing, right: spacing)
    }

    private func sizeForRowDependency() -> CGSize? {
        guard let viewWidth = collectionView?.bounds.size.width,
            !isItemsSizeSet else { return nil }

        let inset = collectionView?.contentInset ?? UIEdgeInsets.zero
        let availableWidth = viewWidth - inset.left - inset.right
        let itemsPerRow: CGFloat = CGFloat(numberOfItemsPerLine)
        let width = (availableWidth - (itemsPerRow + 1) * spacing) / itemsPerRow

        switch sizeMode {
        case .square:
            return CGSize(width: width, height: width)
        case .rectangle(let ratio):
            return CGSize(width: width, height: width * (1 / ratio))
        }
    }

    private func sizeForColumnDependency() -> CGSize? {
        guard let viewheight = collectionView?.bounds.size.height,
            !isItemsSizeSet else { return nil }

        let inset = collectionView?.contentInset ?? UIEdgeInsets.zero
        let availableHeight = viewheight - inset.top - inset.bottom
        let itemsPerLine: CGFloat = CGFloat(numberOfItemsPerLine)
        let height = (availableHeight - (itemsPerLine + 1) * spacing) / itemsPerLine

        switch sizeMode {
        case .square:
            return CGSize(width: height, height: height)
        case .rectangle(let ratio):
            return CGSize(width: height * ratio, height: height)
        }
    }
}


