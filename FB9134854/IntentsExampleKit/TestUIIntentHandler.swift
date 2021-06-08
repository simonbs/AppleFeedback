//
//  TestExtensionIntentHandler.swift
//  IntentsExampleKit
//
//  Created by Simon Støvring on 08/06/2021.
//

import Intents

final class TestUIIntentHandler: NSObject, TestUIIntentHandling {
    func handle(intent: TestUIIntent, completion: @escaping (TestUIIntentResponse) -> Void) {
        let response = TestUIIntentResponse(code: .success, userActivity: nil)
        completion(response)
    }
}
