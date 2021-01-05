//
//  MainView.swift
//  TextViewDemo
//
//  Created by Simon Støvring on 05/01/2021.
//

import UIKit

final class MainView: UIView {
    let textView: UITextView = {
        let this = UITextView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.autocorrectionType = .no
        this.autocapitalizationType = .none
        this.smartQuotesType = .no
        this.smartDashesType = .no
        this.smartInsertDeleteType = .no
        this.spellCheckingType = .no
        this.alwaysBounceVertical = true
        this.textColor = .label
        this.font = UIFont(name: "Menlo-Regular", size: 16)
        return this
    }()
    let activityIndicatorView: UIActivityIndicatorView = {
        let this = UIActivityIndicatorView(style: .large)
        this.translatesAutoresizingMaskIntoConstraints = false
        this.hidesWhenStopped = true
        this.color = .secondaryLabel
        return this
    }()

    init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(textView)
        addSubview(activityIndicatorView)
    }

    private func setupLayout() {
        textView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        textView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        textView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        textView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
