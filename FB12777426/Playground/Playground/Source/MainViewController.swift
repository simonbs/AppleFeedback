import SwiftUI
import UIKit

final class MainViewController: UIViewController {
    override var preferredContainerBackgroundStyle: UIContainerBackgroundStyle {
        .glass
    }

    private let contentView = MainView()
    private let footerOrnamentViewModel = FooterOrnamentViewModel()

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateValues()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateValues()
        setupOrnaments()
        updateValues()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateValues()
    }

    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        updateValues()
    }

    override func viewLayoutMarginsDidChange() {
        super.viewLayoutMarginsDidChange()
        updateValues()
    }
}

private extension MainViewController {
    private func setupOrnaments() {
        ornaments = [
            UIHostingOrnament(sceneAlignment: .bottom, contentAlignment: .center) {
                FooterOrnamentView(viewModel: footerOrnamentViewModel)
            }
        ]
    }

    private func updateValues() {
        footerOrnamentViewModel.text = [
            "safeAreaInsets = \(view.safeAreaInsets)",
            "layoutMargins = \(view.layoutMargins)"
        ].joined(separator: "\n")
    }
}
