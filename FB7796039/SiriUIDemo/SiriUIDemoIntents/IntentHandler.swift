//
//  IntentHandler.swift
//  SiriUIDemoIntents
//
//  Created by Simon Støvring on 26/06/2020.
//

import Intents

class IntentHandler: INExtension {
    override func handler(for intent: INIntent) -> Any {
        return self
    }
}

// MARK: - SiriUIDemoIntentHandling
extension IntentHandler: SiriUIDemoIntentHandling {
    func handle(intent: SiriUIDemoIntent, completion: @escaping (SiriUIDemoIntentResponse) -> Void) {
        completion(SiriUIDemoIntentResponse(code: .success, userActivity: nil))
    }
}
