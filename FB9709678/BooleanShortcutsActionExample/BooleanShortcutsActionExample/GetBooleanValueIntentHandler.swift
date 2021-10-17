//
//  IntentHandler.swift
//  BooleanShortcutsActionExample
//
//  Created by Simon Støvring on 17/10/2021.
//

import Foundation
import Intents

final class GetBooleanValueIntentHandler: NSObject, GetBooleanValueIntentHandling {
    func handle(intent: GetBooleanValueIntent, completion: @escaping (GetBooleanValueIntentResponse) -> Void) {
        let response = GetBooleanValueIntentResponse(code: .success, userActivity: nil)
        response.value = true as NSNumber
        completion(response)
    }
}
