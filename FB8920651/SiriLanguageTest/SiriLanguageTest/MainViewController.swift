//
//  MainViewController.swift
//  SiriLanguageTest
//
//  Created by Simon Støvring on 28/11/2020.
//

import UIKit

class MainViewController: UIViewController {
    private let contentView = MainView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.addShortcutButton.addTarget(self, action: #selector(addShortcut), for: .touchUpInside)
    }
}

private extension MainViewController {
    @objc private func addShortcut() {
        if let url = URL(string: "https://www.icloud.com/shortcuts/567ca4e23e934513b35741c404fc1c88") {
            UIApplication.shared.open(url)
        }
    }
}
