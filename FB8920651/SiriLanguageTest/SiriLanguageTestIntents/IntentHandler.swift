//
//  IntentHandler.swift
//  SiriLanguageTestIntents
//
//  Created by Simon Støvring on 28/11/2020.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        if intent is TestLanguageIntent {
            return TestLanguageIntentHandler()
        } else {
            fatalError("Unsupported intent")
        }
    }
}
