//
//  SceneDelegate.swift
//  URLWidgetParameterExample
//
//  Created by Simon Støvring on 07/08/2021.
//

import UIKit
import ExampleKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let windowScene = scene as! UIWindowScene
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }

    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        if let intent = userActivity.interaction?.intent as? FavoriteURLIntent {
            let viewController = window!.rootViewController as! ViewController
            viewController.didReceiveURL(intent.url)
        }
    }
}

