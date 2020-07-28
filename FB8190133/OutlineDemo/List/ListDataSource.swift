//
//  ListDataSource.swift
//  OutlineDemo
//
//  Created by Simon Støvring on 28/07/2020.
//

import UIKit

final class ListDataSource: NSObject {
    private let items: [ListItem]
    private unowned var collectionView: UICollectionView
    private var dataSource: UICollectionViewDiffableDataSource<ListContent.Section, ListContent.Item>!
    private let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, ListItem> { cell, _, item in
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        cell.contentConfiguration = content
        if item.children != nil {
            cell.accessories = [.outlineDisclosure()]
        } else {
            cell.accessories = []
        }
    }

    init(items: [ListItem], collectionView: UICollectionView) {
        self.items = items
        self.collectionView = collectionView
        super.init()
    }

    func prepare() {
        installDataSource()
        setupSnapshot()
    }
}

private extension ListDataSource {
    private func setupSnapshot(animated: Bool = false) {
        var snapshot = NSDiffableDataSourceSnapshot<ListContent.Section, ListContent.Item>()
        let sections: [ListContent.Section] = items.map { .parent($0) }
        snapshot.appendSections(sections)
        dataSource.apply(snapshot, animatingDifferences: animated)
        for item in items {
            var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<ListContent.Item>()
            sectionSnapshot.append([.child(item)])
            if let children = item.children {
                let childItems: [ListContent.Item] = children.map { .child($0) }
                sectionSnapshot.append(childItems, to: .child(item))
            }
            dataSource.apply(sectionSnapshot, to: .parent(item), animatingDifferences: animated)
        }
    }
    
    private func installDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { [unowned self] _, indexPath, cell in
            switch cell {
            case .child(let item):
                return self.collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
            }
        }
    }
}
