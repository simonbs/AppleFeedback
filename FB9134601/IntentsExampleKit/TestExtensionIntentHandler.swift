//
//  TestExtensionIntentHandler.swift
//  IntentsExampleKit
//
//  Created by Simon Støvring on 08/06/2021.
//

import Intents

final class TestExtensionIntentHandler: NSObject, TestExtensionIntentHandling {
    func handle(intent: TestExtensionIntent, completion: @escaping (TestExtensionIntentResponse) -> Void) {
        let response = TestExtensionIntentResponse(code: .success, userActivity: nil)
        completion(response)
    }
}
