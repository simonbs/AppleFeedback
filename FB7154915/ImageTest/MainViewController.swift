//
//  MainViewController.swift
//  ShortcutImages
//
//  Created by Simon Støvring on 29/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit
import ImageTestKit

final class MainViewController: UIViewController {
    private let contentView = MainView()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "ImageTest"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showInstructions()
    }

    func handle(_ intent: ImageTestIntent) {
        guard let file = intent.image else {
            showInstructions()
            return
        }
        if let image = UIImage(data: file.data) {
            showSuccess(with: image)
        } else {
            showErrorMessage(with: file.data)
        }
    }
}

private extension MainViewController {
    private func showInstructions() {
        contentView.imageView.isHidden = true
        contentView.messageLabel.textColor = .label
        contentView.messageLabel.text = "Hi 👋\n"
            + "Thanks for running my example project 😊"
            + "\n\n"
            + "In order to reproduce the issue, you need to perform the following steps:\n"
            + "1. Create a shortcut that uses the \"Image Input Test\" action.\n"
            + "2. Provide an image as input to the shortcut.\n"
            + "3. Run your shortcut from the editor. This app will open and show that everything works.\n"
            + "4. Now try to run the shortcut from \"My Shortcuts\" (the grid). This app will open and show that the image was not provided."
    }

    private func showSuccess(with image: UIImage) {
        contentView.imageView.isHidden = false
        contentView.messageLabel.textColor = .label
        contentView.imageView.image = image
        contentView.messageLabel.text = "The data could be decoded to an image so it looks like you ran the shortcut from the editor - or maybe you fixed the bug? 💙"
     }

    private func showErrorMessage(with data: Data) {
        contentView.imageView.isHidden = true
        contentView.messageLabel.textColor = .red
        contentView.messageLabel.text = "It looks like you ran the shortcut from \"My Shortcuts\" (the grid). The image data has \(data.count) byte(s) and cannot be decoded into an image."
    }
}
