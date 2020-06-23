//
//  BookmarkStore.swift
//  ShortcutBookmarksKit
//
//  Created by Simon Støvring on 31/08/2019.
//  Copyright © 2019 SimonBS. All rights reserved.
//

import Foundation

public enum BookmarkStoreError: Error {
    case notFound
    case invalid

    public var localizedDescription: String {
        switch self {
        case .notFound:
            return "The bookmark could not be found."
        case .invalid:
            return "The bookmark is not valid."
        }
    }
}

public struct Bookmark {
    public let url: URL
    public let localizedFilename: String?
    public let filename: String?
    public let isDirectory: Bool
}

public final class BookmarkStore {
    private enum Key {
        static let bookmarkData = "bookmarkData"
    }

    public var containsBookmark: Bool {
        return userDefaults.data(forKey: Key.bookmarkData) != nil
    }

    private let userDefaults: UserDefaults
    private let resourceKeys: Set<URLResourceKey> = [
        .nameKey, .localizedNameKey, .isDirectoryKey
    ]

    public init() {
        let suitName = AppConfig.appGroupIdentifier
        guard let userDefaults = UserDefaults(suiteName: suitName) else {
            fatalError("Cannot create user defaults with app group identifier \"\(suitName)\". Please update the app group identifier in AppConfig.swift")
        }
        self.userDefaults = userDefaults
    }

    public func resolveBookmark() -> Result<Bookmark, BookmarkStoreError> {
        guard let bookmarkData = userDefaults.data(forKey: Key.bookmarkData) else {
            return .failure(.notFound)
        }
        do {
            var isStale: ObjCBool = false
            let nsURL = try NSURL(
                resolvingBookmarkData: bookmarkData,
                options: [],
                relativeTo: nil,
                bookmarkDataIsStale: &isStale)
            let url = nsURL as URL
            let didStartAccessingSecurityScopedResource = url.startAccessingSecurityScopedResource()
            defer {
                if didStartAccessingSecurityScopedResource {
                    url.stopAccessingSecurityScopedResource()
                }
            }
            if isStale.boolValue {
                let bookmarkData = try createBookmark(from: url)
                userDefaults.set(bookmarkData, forKey: Key.bookmarkData)
            }
            let resourceValues = try url.resourceValues(forKeys: resourceKeys)
            let localizedFilename = resourceValues.localizedName
            let filename = resourceValues.name
            let isDirectory = resourceValues.isDirectory ?? false
            let bookmark = Bookmark(
                url: url,
                localizedFilename: localizedFilename,
                filename: filename,
                isDirectory: isDirectory)
            return .success(bookmark)
        } catch {
            return .failure(.invalid)
        }
    }

    public func bookmark(_ url: URL) throws {
        let bookmarkData = try createBookmark(from: url)
        userDefaults.set(bookmarkData, forKey: Key.bookmarkData)
    }
}

private extension BookmarkStore {
    private func createBookmark(from url: URL) throws -> Data {
        let didStartAccessingSecurityScopedResource = url.startAccessingSecurityScopedResource()
        defer {
            if didStartAccessingSecurityScopedResource {
                url.stopAccessingSecurityScopedResource()
            }
        }
        return try url.bookmarkData(
            options: [],
            includingResourceValuesForKeys: nil,
            relativeTo: nil)
    }
}
