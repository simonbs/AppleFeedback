# Shortcut Bookmarks

This is a sample project showing that bookmarks created with myURL.bookmarkData(options:includingResourceValuesForKeys:relativeTo:) and stored in an app group cannot be resolved in a intent app extension.

**Important**: Before running this sample project, you must:
1. Go to the Signing & Capabilities settings for the "ShortcutBookmarks" target and specify a valid app group.
2. Go to the Signing & Capabilities settings for the "ShortcutBookmarksIntents" target and specify a valid app group.
3. Edit `appGroupIdentifier` in AppConfig.swift to hold your app group ID.

To reproduce the issue you should:
1. Run the app.
2. Press "Add Bookmark".
3. Choose if you want to bookmark a folder or a file. It doesn't matter which one you pick.
4. Pick a folder or a file.
5. Go to the Shortcuts app and create a shortcut that uses the "Resolve Bookmark" action. The action takes no input parameters.
6. Run the shortcut.
7. You should now get an error saying that the bookmark could not be resolved.
