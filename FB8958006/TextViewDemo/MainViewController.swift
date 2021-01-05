//
//  MainViewController.swift
//  TextViewDemo
//
//  Created by Simon Støvring on 05/01/2021.
//

import UIKit

final class MainViewController: UIViewController {
    private let contentView = MainView()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Example"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hang", style: .plain, target: self, action: #selector(hang))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadText()
    }
}

private extension MainViewController {
    @objc private func hang() {
        contentView.textView.isScrollEnabled = false
        contentView.textView.isScrollEnabled = true
    }

    private func loadText() {
        contentView.activityIndicatorView.startAnimating()
        DispatchQueue.global(qos: .userInitiated).async {
            let fileURL = Bundle.main.url(forResource: "sample", withExtension: "json")!
            let text = try! String(contentsOf: fileURL)
            DispatchQueue.main.sync {
                self.contentView.textView.text = text
                self.contentView.activityIndicatorView.stopAnimating()
            }
        }
    }
}
