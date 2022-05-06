//
//  SceneDelegate.swift
//  DocumentBrowser
//
//  Created by Simon Støvring on 06/05/2022.
//

import UIKit
import UniformTypeIdentifiers

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            fatalError("Unexpected type of scene: \(type(of: scene))")
        }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
    }
}

private extension SceneDelegate {
    private func makeRootViewController() -> UIViewController {
        let documentBrowserViewController = UIDocumentBrowserViewController(forOpening: [.item])
        documentBrowserViewController.allowsPickingMultipleItems = false
        documentBrowserViewController.shouldShowFileExtensions = true
        return documentBrowserViewController
    }
}
