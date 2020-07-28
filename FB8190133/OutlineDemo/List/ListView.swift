//
//  ListView.swift
//  OutlineDemo
//
//  Created by Simon Støvring on 28/07/2020.
//

import UIKit

final class ListView: UIView {
    let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout { _, layoutEnvironment in
            var config = UICollectionLayoutListConfiguration(appearance: .plain)
            config.headerMode = .firstItemInSection
            return .list(using: config, layoutEnvironment: layoutEnvironment)
        }
        let this = UICollectionView(frame: .zero, collectionViewLayout: layout)
        this.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        this.backgroundColor = .systemBackground
        return this
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(collectionView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = bounds
    }
}
