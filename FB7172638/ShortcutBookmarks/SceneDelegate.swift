//
//  SceneDelegate.swift
//  ShortcutBookmarks
//
//  Created by Simon Støvring on 31/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit
import Intents
import ShortcutBookmarksKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: MainViewController())
        window?.makeKeyAndVisible()
    }
}
