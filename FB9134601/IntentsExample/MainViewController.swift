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
        this.text = "Hi 👋\n\nThanks for taking a look at my sample project.\n\nThe sample project comes with two actions:\n\n1. Test Extension. The action runs in the Intents extension and shows a message on completion.\n\n2. Test In-App. The action runs with the in-app intent handling introduced in 2020 and shows a message on completion.\n\nBoth actions works in Shortcuts on iOS and iPadOS but only the second works in Shortcuts on macOS 12."
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
