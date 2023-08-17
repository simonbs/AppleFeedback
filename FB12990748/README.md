# Activating an existing UISceneSession should bring the window to the foreground

Creating a UISceneSessionActivationRequest and supplying an existing scene and passing the request to UIApplication.shared.activateSceneSession(for:) should bring the existing window to the foreground.

Currently, apps cannot bring an already open window the foreground on visionOS. This is an issue for apps that have lets developers open a specific feature in a new window but it only makes sense to have a single instance of this window open. In this case, pressing a button the first time might open a new window but pressing it a second time does nothing. Pressing it the second time should bring the existing window to the foreground.
