//
//  IntentViewController.swift
//  TestIntentsUI
//
//  Created by Simon Støvring on 08/06/2021.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling {
    private let titleLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textAlignment = .center
        this.textColor = .label
        this.font = .preferredFont(forTextStyle: .headline)
        this.text = "If you're seeing this then it works ✨👀"
        return this
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        let maximumSize = self.extensionContext!.hostedViewMaximumAllowedSize
        let size = CGSize(width: maximumSize.width, height: 200)
        completion(true, parameters, size)
    }
}
