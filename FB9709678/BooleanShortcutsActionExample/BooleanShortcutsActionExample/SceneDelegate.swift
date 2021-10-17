//
//  SceneDelegate.swift
//  BooleanShortcutsActionExample
//
//  Created by Simon Støvring on 17/10/2021.
//

import SwiftUI
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let windowScene = scene as! UIWindowScene
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UIHostingController(rootView: MainView())
        window?.makeKeyAndVisible()
    }
}

