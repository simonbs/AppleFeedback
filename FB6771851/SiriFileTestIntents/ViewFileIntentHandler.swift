//
//  ViewFileIntentHandler.swift
//  SiriFileTestIntents
//
//  Created by Simon Støvring on 01/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Intents
import SiriFileTestKit

final class ViewFileIntentHandler: NSObject, ViewFileIntentHandling {
    func handle(intent: ViewFileIntent, completion: @escaping (ViewFileIntentResponse) -> Void) {
        guard let file = intent.file else {
            completion(.init(code: .fileUnavailable, userActivity: nil))
            return
        }
        guard let str = String(data: file.data, encoding: .utf8) else {
            completion(.init(code: .failedCreatingString, userActivity: nil))
            return
        }
        let response = ViewFileIntentResponse(code: .success, userActivity: nil)
        response.fileContent = str
        completion(response)
    }

    func resolveFile(for intent: ViewFileIntent, with completion: @escaping (ViewFileFileResolutionResult) -> Void) {
        if let file = intent.file {
            completion(.success(with: file))
        } else {
            // We're hitting this case when selecting a dynamically provided file.
            completion(.unsupported(forReason: .illegalFile))
        }
    }

    func provideFileOptions(for intent: ViewFileIntent, with completion: @escaping ([INFile]?, Error?) -> Void) {
        let fileContentA = "Hello Shortcuts team 👋"
        let fileContentB = "Thanks for taking a look at my sample project 🙏"
        let fileContentC = "You're doing great work 👏"
        let fileContentD = "Sincerely, Simon"
        let fileContents = [fileContentA, fileContentB, fileContentC, fileContentD]
        let files: [INFile] = fileContents.map { fileContent in
            let data = fileContent.data(using: fileContent.fastestEncoding)!
            return INFile(data: data, filename: fileContent, typeIdentifier: "public.plain-text")
        }
        completion(files, nil)
    }
}
