//
//  AppDelegate.swift
//  IntentsExample
//
//  Created by Simon Støvring on 08/06/2021.
//

import Intents
import IntentsExampleKit
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication, handlerFor intent: INIntent) -> Any? {
        return IntentHandlerFactory.makeHandler(for: intent)
    }
}
