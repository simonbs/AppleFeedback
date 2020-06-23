//
//  ViewController.swift
//  SiriFileTest
//
//  Created by Simon Støvring on 31/07/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let messageLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .label
        this.font = .preferredFont(forTextStyle: .body)
        this.textAlignment = .center
        this.numberOfLines = 0
        this.text = "Hello 👋\nAnd thanks for trying my sample app 🙏\n\nWhile I'm very happy that you have opened the app, there's not really anything to see here 👀\n\nInstead you should go to the Shortcuts app and try SiriFileTests \"View File\" action 😊"
        return this
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(messageLabel)
        messageLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        messageLabel.topAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.topAnchor).isActive = true
        messageLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

