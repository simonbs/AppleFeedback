//
//  IntentHandler.swift
//  SBSIntents
//
//  Created by Simon Støvring on 16/06/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Intents
import SBSKit

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        if intent is SBSExampleIntent {
            return SBSExampleIntentHandler()
        } else {
            fatalError("Unsupported intent of type \(type(of: intent)).")
        }
    }
}

final class SBSExampleIntentHandler: NSObject, SBSExampleIntentHandling {
    func handle(intent: SBSExampleIntent, completion: @escaping (SBSExampleIntentResponse) -> Void) {
        completion(SBSExampleIntentResponse(code: .success, userActivity: nil))
    }
}
