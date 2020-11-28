//
//  MainView.swift
//  SiriLanguageTest
//
//  Created by Simon Støvring on 28/11/2020.
//

import UIKit

final class MainView: UIView {
    private let messageLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.text = """
        This example project shows that properties in an the response of an intent only works properly when Siri is set to English.

        Follow these steps to reproduce the error:

        1. Go to the Shortcuts app and create a shortcut. Add the "Test Language" action.
        2. Have your language for Siri set to English (United States).
        3. Run your newly created shortcut using Siri.
        4. Notice that Siri says "OK, done." followed by a long message.
        5. Set the language for Siri to Danish.
        6. Run the shortcut again.
        7. Notice that Siri says "OK, udført" but omits the long message.

        The intent file have variants for English, Danish and German, so I believe Siri should work properly in those three languages at least.
        """
        this.numberOfLines = 0
        this.font = .preferredFont(forTextStyle: .body)
        this.textColor = .label
        return this
    }()
    let addShortcutButton: UIButton = {
        let this = UIButton(type: .system)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.setTitle("Add Example Shortcut", for: .normal)
        return this
    }()

    private let contentGuide = UILayoutGuide()

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
        addSubview(addShortcutButton)
        addLayoutGuide(contentGuide)
    }

    private func setupLayout() {
        contentGuide.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        contentGuide.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        contentGuide.topAnchor.constraint(greaterThanOrEqualTo: layoutMarginsGuide.topAnchor).isActive = true
        contentGuide.bottomAnchor.constraint(lessThanOrEqualTo: layoutMarginsGuide.bottomAnchor).isActive = true
        contentGuide.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor).isActive = true

        messageLabel.leadingAnchor.constraint(equalTo: contentGuide.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: contentGuide.trailingAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: contentGuide.topAnchor).isActive = true

        addShortcutButton.leadingAnchor.constraint(equalTo: contentGuide.leadingAnchor).isActive = true
        addShortcutButton.trailingAnchor.constraint(equalTo: contentGuide.trailingAnchor).isActive = true
        addShortcutButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 10).isActive = true
        addShortcutButton.bottomAnchor.constraint(equalTo: contentGuide.bottomAnchor).isActive = true
        addShortcutButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
