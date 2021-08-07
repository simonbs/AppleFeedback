//
//  ViewController.swift
//  URLWidgetParameterExample
//
//  Created by Simon Støvring on 07/08/2021.
//

import UIKit

class ViewController: UIViewController {
    private let titleLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textAlignment = .center
        this.font = .preferredFont(forTextStyle: .body)
        this.numberOfLines = 0
        return this
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        titleLabel.text = "Please setup a widget with a URL and select the widget on the Home screen to open the host app."
        titleLabel.textColor = .label
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: view.layoutMarginsGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.layoutMarginsGuide.bottomAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor)
        ])
    }

    func didReceiveURL(_ url: URL?) {
        if let url = url {
            titleLabel.text = url.absoluteString
            view.backgroundColor = .white
            view.backgroundColor = .systemGreen
        } else {
            titleLabel.text = "No URL provided."
            view.backgroundColor = .white
            view.backgroundColor = .systemRed
        }
    }
}

