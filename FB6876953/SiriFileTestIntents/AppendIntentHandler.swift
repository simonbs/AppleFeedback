//
//  AppendIntentHandler.swift
//  SiriFileTestIntents
//
//  Created by Simon Støvring on 31/07/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Intents
import SiriFileTestKit

final class AppendIntentHandler: NSObject, AppendIntentHandling {
    func handle(intent: AppendIntent, completion: @escaping (AppendIntentResponse) -> Void) {
        let text = intent.text!
        let fileURL = intent.file!.fileURL!
        let didStartAccessingSecurityScopedResource = fileURL.startAccessingSecurityScopedResource()
        defer {
            if didStartAccessingSecurityScopedResource {
                fileURL.stopAccessingSecurityScopedResource()
            }
        }
        do {
            // 1. Read the file from the URL as a string.
            // 2. Append the input text to the original text.
            // 3. Save the new text to the file.
            //
            // Step #3 fails on iOS 13 beta 5.
            let originalText = try String(contentsOf: fileURL)
            let newText = originalText + "\n" + text
            if let data = newText.data(using: newText.fastestEncoding) {
                try data.write(to: fileURL)
                completion(AppendIntentResponse(code: .success, userActivity: nil))
            } else {
                completion(AppendIntentResponse.errorMessage("Cannot create data from string"))
            }
        } catch {
            let nsError = (error as NSError)
            if nsError.code == NSFileWriteNoPermissionError {
                // This is the error that's occurring in iOS 13 beta 5.
                completion(AppendIntentResponse.errorMessage("The intent does not have permission to write to the file at \(fileURL.absoluteString) (Error code \(nsError.code))"))
            } else {
                completion(AppendIntentResponse.errorMessage(error.localizedDescription))
            }
        }
    }

    func resolveText(for intent: AppendIntent, with completion: @escaping (AppendTextResolutionResult) -> Void) {
        if let text = intent.text {
            completion(.success(with: text))
        } else {
            completion(.unsupported(forReason: .textUnavailable))
        }
    }

    func resolveFile(for intent: AppendIntent, with completion: @escaping (AppendFileResolutionResult) -> Void) {
        if let file = intent.file, file.fileURL != nil {
            completion(.success(with: file))
        } else {
            completion(.unsupported(forReason: .fileUnavailable))
        }
    }
}
