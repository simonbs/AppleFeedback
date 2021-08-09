//
//  MainView.swift
//  WebKitExample
//
//  Created by Simon on 09/08/2021.
//

import UIKit
import WebKit

final class MainView: UIView {
    let webView: WKWebView = {
        let this = WKWebView()
        this.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(webView)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: trailingAnchor),
            webView.topAnchor.constraint(equalTo: topAnchor),
            webView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
