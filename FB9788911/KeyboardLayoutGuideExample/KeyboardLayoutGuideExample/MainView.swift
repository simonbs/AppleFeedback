//
//  MainView.swift
//  KeyboardLayoutGuideExample
//
//  Created by Simon on 30/11/2021.
//

import UIKit

final class MainView: UIView {
    private let firstGuideView: GuideView
    private let secondGuideView: GuideView
    private let textField: UITextField = {
        let this = UITextField()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.placeholder = "Put your cursor here to present the keyboard"
        this.backgroundColor = .systemBackground
        this.layer.cornerCurve = .continuous
        this.layer.cornerRadius = 8
        return this
    }()

    init(observeKeyboardInFirstGuide: Bool, observeKeyboardInSecondGuide: Bool) {
        firstGuideView = GuideView(observeKeyboard: observeKeyboardInFirstGuide)
        secondGuideView = GuideView(observeKeyboard: observeKeyboardInSecondGuide)
        firstGuideView.translatesAutoresizingMaskIntoConstraints = false
        secondGuideView.translatesAutoresizingMaskIntoConstraints = false
        firstGuideView.color = .systemPurple
        secondGuideView.color = .systemOrange
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(firstGuideView)
        addSubview(secondGuideView)
        addSubview(textField)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            firstGuideView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            firstGuideView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor, constant: -10),
            firstGuideView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            firstGuideView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),

            secondGuideView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor, constant: 10),
            secondGuideView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            secondGuideView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            secondGuideView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),

            textField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor, constant: 15),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 375),
            textField.heightAnchor.constraint(equalToConstant: 64)
        ])
    }
}
