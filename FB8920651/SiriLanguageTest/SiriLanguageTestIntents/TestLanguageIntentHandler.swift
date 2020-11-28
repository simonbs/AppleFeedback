//
//  TestLanguageIntentHandler.swift
//  SiriLanguageTestIntents
//
//  Created by Simon Støvring on 28/11/2020.
//

import Foundation

final class TestLanguageIntentHandler: NSObject, TestLanguageIntentHandling {
    func handle(intent: TestLanguageIntent, completion: @escaping (TestLanguageIntentResponse) -> Void) {
        let message = "This message is shown when using Siri in English, but not when using Siri in Danish, German or other languages."
        let response = TestLanguageIntentResponse.success(message: message)
        completion(response)
    }
}

