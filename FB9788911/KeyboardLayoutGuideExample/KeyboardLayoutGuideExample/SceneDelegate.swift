//
//  SceneDelegate.swift
//  KeyboardLayoutGuideExample
//
//  Created by Simon on 30/11/2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let windowScene = scene as! UIWindowScene
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = makeRootViewController()
        window?.makeKeyAndVisible()
    }
}

private extension SceneDelegate {
    private func makeRootViewController() -> UIViewController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            makeFirstViewController(),
            makeSecondViewController(),
            makeThirdViewController()
        ]
        return tabBarController
    }

    private func makeFirstViewController() -> UIViewController {
        let viewController = MainViewController(observeKeyboardInFirstGuide: true, observeKeyboardInSecondGuide: false)
        viewController.title = "✅ / 🚫"
        return UINavigationController(rootViewController: viewController)
    }

    private func makeSecondViewController() -> UIViewController {
        let viewController = MainViewController(observeKeyboardInFirstGuide: false, observeKeyboardInSecondGuide: true)
        viewController.title = "🚫 / ✅"
        return UINavigationController(rootViewController: viewController)
    }

    private func makeThirdViewController() -> UIViewController {
        let viewController = MainViewController(observeKeyboardInFirstGuide: true, observeKeyboardInSecondGuide: true)
        viewController.title = "✅ / ✅"
        return UINavigationController(rootViewController: viewController)
    }
}
