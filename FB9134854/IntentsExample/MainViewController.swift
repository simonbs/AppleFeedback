//
//  MainViewController.swift
//  IntentsExample
//
//  Created by Simon Støvring on 08/06/2021.
//

import UIKit

class MainViewController: UIViewController {
    private let textLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .label
        this.font = .preferredFont(forTextStyle: .body)
        this.numberOfLines = 0
        this.text = "Hi 👋\n\nThanks for taking a look at my sample project.\n\nThe sample project contains a single action called \"Test UI\". Running this action in Shortcuts should present a simple UI with a label. This works fine on iOS and iPadOS but the UI is not shown when running from Shortcuts on macOS 12.\n\nThis sample project is only using in-app intent handling because I've had issues getting Intents extensions to handle the intents on macOS 12 (FB9134601)"
        return this
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            textLabel.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            textLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
