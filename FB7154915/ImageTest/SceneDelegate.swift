//
//  SceneDelegate.swift
//  ImageTest
//
//  Created by Simon Støvring on 29/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit
import ImageTestKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private let mainViewController = MainViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        window?.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard let intent = userActivity.interaction?.intent as? ImageTestIntent else {
            return
        }
        mainViewController.handle(intent)
    }
}
