//
//  TestInAppIntentHandler.swift
//  IntentsExampleKit
//
//  Created by Simon Støvring on 08/06/2021.
//

import Foundation

final class TestInAppIntentHandler: NSObject, TestInAppIntentHandling {
    func handle(intent: TestInAppIntent, completion: @escaping (TestInAppIntentResponse) -> Void) {
        let response = TestInAppIntentResponse(code: .success, userActivity: nil)
        completion(response)
    }
}
