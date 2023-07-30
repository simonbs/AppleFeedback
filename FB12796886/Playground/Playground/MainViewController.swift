import Combine
import SwiftUI
import UIKit

final class MainViewController: UIViewController {
    override var preferredContainerBackgroundStyle: UIContainerBackgroundStyle {
        .glass
    }
    
    private let settingsStore = SettingsStore()
    private var exampleView: UIView?
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSettingsView()
        setupSettingObservers()
    }
}

private extension MainViewController {
    private func setupSettingsView() {
        let settingsView = SettingsView(settingsStore: settingsStore)
        let hostingController = UIHostingController(rootView: settingsView)
        addChild(hostingController)
        hostingController.view.backgroundColor = .red
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupSettingObservers() {
        Publishers.CombineLatest3(
            settingsStore.useSystemBackgroundColor,
            settingsStore.showMiddleLayer,
            settingsStore.showVisualEffectView
        )
        .map(ExampleView.init)
        .sink { [weak self] newExampleView in
            self?.removeExampleView()
            self?.setupExampleView(newExampleView)
        }
        .store(in: &cancellables)
    }

    private func removeExampleView() {
        if let exampleView {
            exampleView.removeFromSuperview()
            self.exampleView = nil
        }
    }

    private func setupExampleView(_ exampleView: UIView) {
        self.exampleView = exampleView
        exampleView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(exampleView, at: 0)
        NSLayoutConstraint.activate([
            exampleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exampleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            exampleView.topAnchor.constraint(equalTo: view.topAnchor),
            exampleView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
