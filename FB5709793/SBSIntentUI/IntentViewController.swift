//
//  IntentViewController.swift
//  SBSIntentUI
//
//  Created by Simon Støvring on 16/06/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling {
    private let stackView: UIStackView = {
        let this = UIStackView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.axis = .vertical
        this.spacing = 10
        return this
    }()
    private let reportedSizeLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .white
        this.textAlignment = .center
        this.font = .systemFont(ofSize: 15)
        return this
    }()
    private let actualSizeLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .white
        this.textAlignment = .center
        this.font = .systemFont(ofSize: 15)
        return this
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        stackView.addArrangedSubview(reportedSizeLabel)
        stackView.addArrangedSubview(actualSizeLabel)
        view.addSubview(stackView)
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        showSizes()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        showSizes()
    }

    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        showSizes()
        completion(true, parameters, self.desiredSize)
    }
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
}

private extension IntentViewController {
    private func format(_ size: CGSize) -> String {
        return "w = " + String(describing: size.width) + ", h = " + String(describing: size.height)
    }

    private func showSizes() {
        if let view = view {
            actualSizeLabel.text = "Actual: " + format(view.bounds.size)
        } else {
            actualSizeLabel.text = nil
        }
        reportedSizeLabel.text = "hostedViewMaximumAllowedSize: "
            + format(extensionContext!.hostedViewMaximumAllowedSize)
    }
}
