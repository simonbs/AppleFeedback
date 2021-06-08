//
//  IntentHandlerFactory.swift
//  IntentsExampleKit
//
//  Created by Simon Støvring on 08/06/2021.
//

import Intents

public final class IntentHandlerFactory {
    public static func makeHandler(for intent: INIntent) -> Any {
        if intent is TestUIIntent {
            return TestUIIntentHandler()
        } else {
            fatalError("Unsupported intent")
        }
    }
}
