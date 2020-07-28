//
//  ListViewController.swift
//  OutlineDemo
//
//  Created by Simon Støvring on 28/07/2020.
//

import UIKit

final class ListViewController: UIViewController {
    private let contentView = ListView()
    private let dataSource: ListDataSource

    init(items: [ListItem]) {
        self.dataSource = ListDataSource(items: items, collectionView: contentView.collectionView)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.prepare()
    }
}
