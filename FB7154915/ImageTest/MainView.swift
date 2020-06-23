//
//  MainView.swift
//  ShortcutImages
//
//  Created by Simon Støvring on 29/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit

final class MainView: UIView {
    let messageLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .label
        this.font = .preferredFont(forTextStyle: .body)
        this.adjustsFontForContentSizeCategory = true
        this.numberOfLines = 0
        return this
    }()
    let imageView: UIImageView = {
        let this = UIImageView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.contentMode = .scaleAspectFit
        return this
    }()

    init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(messageLabel)
        addSubview(imageView)
    }

    private func setupLayout() {
        messageLabel.leadingAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.trailingAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 30).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true

        imageView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 30).isActive = true
        imageView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
