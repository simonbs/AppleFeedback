//
//  IntentViewController.swift
//  SiriUIDemoIntentsUI
//
//  Created by Simon Støvring on 26/06/2020.
//

import IntentsUI

class IntentViewController: UIViewController, INUIHostedViewControlling {
    private let label: UILabel = {
        let this = UILabel()
        this.translatesAutoresizingMaskIntoConstraints = false
        this.text = "This view disappears really fast. This is new in iOS 14 and significantly reduces the amount of use cases for UI in actions."
        this.textAlignment = .center
        this.font = .preferredFont(forTextStyle: .body)
        this.textColor = .white
        this.numberOfLines = 0
        return this
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(label)
        label.frame = view.frame
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        let maxSize = extensionContext!.hostedViewMaximumAllowedSize
        let desiredSize = CGSize(width: maxSize.width, height: 400)
        completion(true, parameters, desiredSize)
    }
}
