import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Expected scene of type UIWindowScene but got an unexpected type")
        }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
    }
}

private extension SceneDelegate {
    private func makeRootViewController() -> UIViewController {
        let documentBrowserViewController = UIDocumentBrowserViewController(forOpening: [.item])
        documentBrowserViewController.delegate = self
        return documentBrowserViewController
    }
}

extension SceneDelegate: UIDocumentBrowserViewControllerDelegate {
    func documentBrowser(
        _ controller: UIDocumentBrowserViewController,
        didPickDocumentsAt documentURLs: [URL]
    ) {
        // Here we would open the selected file but that's not needed for the sake of this example.
        // Instead we just show a plane view controller.
        guard let documentURL = documentURLs.first else {
            return
        }
        let mainViewController = MainViewController()
        mainViewController.title = documentURL.lastPathComponent
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.modalPresentationStyle = .fullScreen
        controller.present(navigationController, animated: true)
    }
}
