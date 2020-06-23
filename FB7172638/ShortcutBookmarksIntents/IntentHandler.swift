//
//  IntentHandler.swift
//  ShortcutBookmarksIntents
//
//  Created by Simon Støvring on 31/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Intents
import ShortcutBookmarksKit

class IntentHandler: INExtension, ResolveBookmarkIntentHandling {
    override func handler(for intent: INIntent) -> Any {
        return self
    }

    func handle(intent: ResolveBookmarkIntent, completion: @escaping (ResolveBookmarkIntentResponse) -> Void) {
        let bookmarkStore = BookmarkStore()
        if bookmarkStore.containsBookmark {
            let bookmarkResult = bookmarkStore.resolveBookmark()
            switch bookmarkResult {
            case .success(let bookmark):
                if let bookmarkName = bookmark.localizedFilename ?? bookmark.filename {
                    completion(ResolveBookmarkIntentResponse.resolvedWithName(bookmarkName: bookmarkName))
                } else {
                    completion(ResolveBookmarkIntentResponse(code: .resolvedWithoutName, userActivity: nil))
                }
            case .failure(let error):
                switch error {
                case .notFound:
                    completion(ResolveBookmarkIntentResponse(code: .notFound, userActivity: nil))
                case .invalid:
                    completion(ResolveBookmarkIntentResponse(code: .invalid, userActivity: nil))
                }
            }
        } else {
            completion(ResolveBookmarkIntentResponse(code: .notFound, userActivity: nil))
        }
    }
}
