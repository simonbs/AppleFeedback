//
//  MainView.swift
//  ShortcutBookmarks
//
//  Created by Simon Støvring on 31/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit

final class MainView: UIView {
    private let stackView: UIStackView = {
        let this = UIStackView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.axis = .vertical
        this.spacing = 20
        return this
    }()
    private let instructionsLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .label
        this.numberOfLines = 0
        this.font = .preferredFont(forTextStyle: .body)
        this.adjustsFontForContentSizeCategory = true
        this.text = "Hi 👋 😊 Thank you for trying my sample project 🙏\n\n"
            + "To reproduce the issue you should:\n\n"
            + "1. Press \"Add Bookmark\".\n"
            + "2. Choose if you want to bookmark a folder or a file. It doesn't matter which one you pick.\n"
            + "3. Pick a folder or a file.\n"
            + "4. Go to the Shortcuts app and create a shortcut that uses the \"Resolve Bookmark\" action. The action takes no input parameters.\n"
            + "5. Run the shortcut.\n"
            + "6. You should now get an error saying that the bookmark could not be resolved."
        return this
    }()
    let bookmarkButton: UIButton = {
        let this = UIButton(type: .system)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.titleLabel?.font = .preferredFont(forTextStyle: .callout)
        this.titleLabel?.adjustsFontForContentSizeCategory = true
        this.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        this.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return this
    }()
    let errorLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .red
        this.numberOfLines = 0
        this.font = .preferredFont(forTextStyle: .body)
        this.adjustsFontForContentSizeCategory = true
        this.textAlignment = .center
        this.isHidden = true
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
        stackView.addArrangedSubview(instructionsLabel)
        stackView.addArrangedSubview(bookmarkButton)
        stackView.addArrangedSubview(errorLabel)
        addSubview(stackView)
    }

    private func setupLayout() {
        stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.bottomAnchor, constant: -20).isActive = true
    }
}
