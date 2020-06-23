//
//  IntentHandler.swift
//  ShortcutImagesIntentHandler
//
//  Created by Simon Støvring on 29/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Intents
import ImageTestKit

class IntentHandler: INExtension, ImageTestIntentHandling {
    override func handler(for intent: INIntent) -> Any {
        return self
    }

    func handle(intent: ImageTestIntent, completion: @escaping (ImageTestIntentResponse) -> Void) {
        let response = ImageTestIntentResponse(code: .continueInApp, userActivity: nil)
        completion(response)
    }

    func resolveImage(for intent: ImageTestIntent, with completion: @escaping (ImageTestImageResolutionResult) -> Void) {
        if let image = intent.image {
            completion(.success(with: image))
        } else {
            completion(.unsupported(forReason: .imageUnavailable))
        }
    }
}
