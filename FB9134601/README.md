# Only actions using in-app intent handling are running properly

It appears that only actions that use the in-app intent handling introduced in 2020 are running properly in Shortcuts on macOS. Actions that run in the Intents extension just open the host app or bring it to the foreground if it’s already running. 

I would expect that actions can run in an Intents extension on macOS 12 without opening the host app or bringing it to the foreground.

I’ve attached a sample project comes with two actions:

1. Test Extension. The action runs in the Intents extension and shows a message on completion.

2. Test In-App. The action runs with the in-app intent handling introduced in 2020 and shows a message on completion.

Both actions works in Shortcuts on iOS and iPadOS but only the second works in Shortcuts on macOS 12.