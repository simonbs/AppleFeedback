# IntentsUI extensions aren't working on macOS 12

It appears that the UI setup in an IntentsUI extension isn’t working in Shortcuts on macOS 12.

I’ve attached a sample project that contains a single action called "Test UI". Running this action in Shortcuts should present a simple UI with a label. This works fine on iOS and iPadOS but the UI is not shown when running from Shortcuts on macOS 12.\

The sample project is only using in-app intent handling because I've had issues getting Intents extensions to handle the intents on macOS 12 (FB9134601)