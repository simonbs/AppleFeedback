import SwiftUI
import UIKit

final class MainViewController: UIViewController {
    override var preferredContainerBackgroundStyle: UIContainerBackgroundStyle {
        .glass
    }
    
    private let contentView = MainView()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSwiftUIView()
    }
}

private extension MainViewController {
    private func setupSwiftUIView() {
        let hostingController = UIHostingController(rootView: SwiftUIView())
        addChild(hostingController)
        contentView.stackView.addArrangedSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
