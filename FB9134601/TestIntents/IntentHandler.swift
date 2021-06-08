//
//  IntentHandler.swift
//  TestIntents
//
//  Created by Simon Støvring on 08/06/2021.
//

import Intents
import IntentsExampleKit

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        return IntentHandlerFactory.makeHandler(for: intent)
    }
}
