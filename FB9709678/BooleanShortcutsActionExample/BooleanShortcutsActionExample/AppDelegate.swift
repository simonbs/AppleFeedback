//
//  AppDelegate.swift
//  BooleanShortcutsActionExample
//
//  Created by Simon Støvring on 17/10/2021.
//

import Intents
import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func application(_ application: UIApplication, handlerFor intent: INIntent) -> Any? {
        if intent is GetBooleanValueIntent {
            return GetBooleanValueIntentHandler()
        } else {
            fatalError("Unsupported intent of type \(type(of: intent))")
        }
    }
}
