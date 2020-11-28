//
//  SceneDelegate.swift
//  SiriLanguageTest
//
//  Created by Simon Støvring on 28/11/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.rootViewController = MainViewController()
            window?.makeKeyAndVisible()
        } else {
            fatalError("Unsupported scene")
        }
    }
}
