//
//  ViewController.swift
//  InputAccessoryViewExample
//
//  Created by Simon on 08/01/2022.
//

import UIKit

final class MainViewController: UIViewController {
    private let contentView = MainView()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Example"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupText()
        setupInputAccessoryView()
    }
}

private extension MainViewController {
    private func setupText() {
        contentView.textView.text = """
When interactively dismissing the keyboard the input accessory view will follow the keyboard but once the input accessory view reaches the bottom, it cannot be dragged out of the screen.

When ending the interaction the input accessory view will stay on the screen for a brief moment and then animate out.

I would have expected the input accessory view to move out of the screen with the keyboard during the interaction.
"""
    }

    private func setupInputAccessoryView() {
        let view = ExampleInputAccessoryView()
        view.dismissButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
        contentView.textView.inputAccessoryView = view
    }

    @objc private func dismissKeyboard() {
        contentView.textView.resignFirstResponder()
    }
}
