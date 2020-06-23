//
//  SceneDelegate.swift
//  DragDropWindow
//
//  Created by Simon Støvring on 18/06/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = UINavigationController(rootViewController: TableViewController())
        window?.makeKeyAndVisible()
    }
}

