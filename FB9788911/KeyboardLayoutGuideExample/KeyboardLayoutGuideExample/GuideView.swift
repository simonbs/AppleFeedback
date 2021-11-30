//
//  GuideView.swift
//  KeyboardLayoutGuideExample
//
//  Created by Simon on 30/11/2021.
//

import UIKit

final class GuideView: UIView {
    var color: UIColor? {
        get {
            return fillView.backgroundColor
        }
        set {
            fillView.backgroundColor = newValue
        }
    }

    private let fillView: UIView = {
        let this = UIView()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.backgroundColor = .systemPurple
        this.alpha = 0.4
        this.layer.cornerCurve = .continuous
        this.layer.cornerRadius = 16
        return this
    }()
    private let titleLabel: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.textColor = .label
        this.textAlignment = .center
        this.font = .preferredFont(forTextStyle: .body)
        this.numberOfLines = 0
        return this
    }()

    private let observeKeyboard: Bool

    init(observeKeyboard: Bool) {
        self.observeKeyboard = observeKeyboard
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        keyboardLayoutGuide.followsUndockedKeyboard = true
        addSubview(fillView)
        addSubview(titleLabel)
        updateText()
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            fillView.leadingAnchor.constraint(equalTo: leadingAnchor),
            fillView.trailingAnchor.constraint(equalTo: trailingAnchor),
            fillView.topAnchor.constraint(equalTo: topAnchor),
            fillView.bottomAnchor.constraint(equalTo: bottomAnchor).sbs_setPriority(.defaultHigh),

            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: fillView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: fillView.trailingAnchor),
            titleLabel.topAnchor.constraint(greaterThanOrEqualTo: fillView.topAnchor),
            titleLabel.bottomAnchor.constraint(lessThanOrEqualTo: fillView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: fillView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: fillView.centerYAnchor)
        ])

        if observeKeyboard {
            keyboardLayoutGuide.setConstraints([
                fillView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -100)
            ], activeWhenNearEdge: .trailing)
        }
    }
}

private extension GuideView {
    private func updateText() {
        var text = "\(Unmanaged.passUnretained(keyboardLayoutGuide).toOpaque())\n\n"
        if observeKeyboard {
            text += "✅ Observe keyboard"
        } else {
            text += "🚫 Do not observe keyboard"
        }
        titleLabel.text = text
    }
}
