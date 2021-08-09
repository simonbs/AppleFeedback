//
//  ViewController.swift
//  WebKitExample
//
//  Created by Simon on 09/08/2021.
//

import UIKit
import WebKit

final class MainViewController: UIViewController {
    private let contentView = MainView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.webView.navigationDelegate = self
        prepareJavaScript()
    }
}

private extension MainViewController {
    private func prepareJavaScript() {
        let js = """
            const myHandler = () => {
alert("Hello world")
    }
"""
        contentView.webView.evaluateJavaScript(js) { [weak self] _, error in
            if let error = error {
                print(error)
            } else {
                print("Did prepare JavaScript")
                self?.loadWebsite()
            }
        }
    }

    private func loadWebsite() {
        let url = URL(string: "https://apple.com")!
        let request = URLRequest(url: url)
        contentView.webView.load(request)
    }

    private func callMyHandler() {
        // This will fail on iOS 15 but succeed on iOS 14.5.
        let js = "myHandler()"
        contentView.webView.evaluateJavaScript(js) { _, error in
            if let error = error {
                // We'll end up here on iOS 15 with the error:
                // ReferenceError: Can't find variable: myHandler
                print(error)
            } else {
                // We'll end up here on iOS 14.5. All is good.
                print("Did evaluate JavaScript")
            }
        }
    }
}

extension MainViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let url = webView.url?.absoluteString ?? ""
        print("Did load " + url)
        callMyHandler()
    }
}
