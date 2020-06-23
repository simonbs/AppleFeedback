//
//  IntentHandler.swift
//  SiriFileTestIntents
//
//  Created by Simon Støvring on 31/07/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Intents
import SiriFileTestKit

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        if intent is ViewFileIntent {
            return ViewFileIntentHandler()
        } else {
            fatalError("Intent of type \(type(of: intent)) is not supported.")
        }
    }
}
