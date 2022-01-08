//
//  ExampleInputAccessoryView.swift
//  InputAccessoryViewExample
//
//  Created by Simon on 08/01/2022.
//

import UIKit

final class ExampleInputAccessoryView: UIInputView {
    private let titleLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.font = .preferredFont(forTextStyle: .body)
        this.text = "Hi 👋 I'm an input accessory view."
        return this
    }()
    let dismissButton: UIButton = {
        let this = UIButton(type: .system)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.setImage(UIImage(systemName: "keyboard.chevron.compact.down"), for: .normal)
        this.tintColor = .label
        return this
    }()
    private let alignmentGuide = UILayoutGuide()

    init() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44)
        super.init(frame: frame, inputViewStyle: .keyboard)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(titleLabel)
        addSubview(dismissButton)
        addLayoutGuide(alignmentGuide)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            dismissButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            dismissButton.topAnchor.constraint(equalTo: topAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: bottomAnchor),

            alignmentGuide.leadingAnchor.constraint(equalTo: leadingAnchor),
            alignmentGuide.trailingAnchor.constraint(equalTo: dismissButton.leadingAnchor),
            alignmentGuide.topAnchor.constraint(equalTo: topAnchor),
            alignmentGuide.bottomAnchor.constraint(equalTo: bottomAnchor),

            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: alignmentGuide.leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: alignmentGuide.trailingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: alignmentGuide.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: alignmentGuide.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: alignmentGuide.bottomAnchor),
        ])
    }
}
