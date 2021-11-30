//
//  MainViewController.swift
//  KeyboardLayoutGuideExample
//
//  Created by Simon on 30/11/2021.
//

import UIKit

final class MainViewController: UIViewController {
    private let contentView: MainView

    init(observeKeyboardInFirstGuide: Bool, observeKeyboardInSecondGuide: Bool) {
        contentView = MainView(
            observeKeyboardInFirstGuide: observeKeyboardInFirstGuide,
            observeKeyboardInSecondGuide: observeKeyboardInSecondGuide)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }
}
