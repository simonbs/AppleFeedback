//
//  SceneDelegate.swift
//  OutlineDemo
//
//  Created by Simon Støvring on 28/07/2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else {
            return
        }
        let firstListViewController = ListViewController(items: ListItem.createExampleData())
        let secondListViewController = ListViewController(items: ListItem.createExampleData())
        secondListViewController.title = "Embedded in Navigation Controller"
        firstListViewController.tabBarItem = UITabBarItem(title: "Not Working", image: UIImage(systemName: "x.circle"), tag: 0)
        secondListViewController.tabBarItem = UITabBarItem(title: "Works", image: UIImage(systemName: "checkmark.circle"), tag: 1)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            firstListViewController,
            UINavigationController(rootViewController: secondListViewController)
        ]
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}

