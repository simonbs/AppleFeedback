//
//  MainViewController.swift
//  KeyCommandExample
//
//  Created by Simon on 13/12/2021.
//

import UIKit

final class MainViewController: UIViewController {
    override var keyCommands: [UIKeyCommand]? {
        let keyCommand = UIKeyCommand(title: "Increase Font Size", action: #selector(increaseFontSize), input: "?", modifierFlags: .command)
        keyCommand.allowsAutomaticMirroring = true
        keyCommand.allowsAutomaticLocalization = false
        keyCommand.wantsPriorityOverSystemBehavior = true
        return [
            keyCommand,
            UIKeyCommand(title: "Decrease Font Size", action: #selector(decreaseFontSize), input: "-", modifierFlags: .command),
        ]
    }

    private let contentView = MainView()
    private var fontSize: CGFloat = 16

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "KeyCommandExample"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
    }
}

private extension MainViewController {
    @objc private func increaseFontSize() {
        fontSize += 1
        updateText()
    }

    @objc private func decreaseFontSize() {
        fontSize -= 1
        updateText()
    }

    private func updateText() {
        let text = """
Hi 👋

Thanks for checking out the sample project 🙌

Here's how to reproduce the issue:

1. Run this app on an iPad with a hardware keyboard attached.
2. Hold down the command key (⌘) until the list of supported shortcuts is shown.
3. Observe that the \"Increase Font Size\" command that is bound to ⌘ + isn't shown in the list but the \"Decrease Font Size\" command that is bound to ⌘ - is shown.
4. Also observe that the ⌘ + shortcut does in fact trigger the \"Increase Font Size\" command even though it isn't shown in the list of supported shortcuts.
"""
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        contentView.titleLabel.attributedText = NSAttributedString(string: text, attributes: [
            .font: UIFont.systemFont(ofSize: fontSize),
            .paragraphStyle: paragraphStyle
        ])
    }
}
