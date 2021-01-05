# INFile on an intent contains empty data when user runs a shortcut from "My Shortcuts" but not when the user runs it from the editor

When an intent handler continues an intent in the application, there is a difference between the inputs provided to the application depending on where in the Shortcuts app the user is running the app from.

Imagine a shortcut action that takes an image as input. The intent has file parameter named "image" which holds the image. The intent handler completes with a "continueInApp" response. Now we have the following two cases.

Case 1: The user runs the shortcut from the editor
scene(:continue:) is called on the scene delegate and a user activity is supplied. The user activity contains the intent. The image parameter on the intent holds an INFile instance which contains the image data. The data is correct and the app can use it to decode the image passed to the shortcut.

Case 2: The user runs the shortcut from "My Shortcuts" (the grid)
In this case scene(:continue:) is also called with a user activity that contains the intent and the image property on that intent is an instance of INFile. However, the data on that INFile contains zero bytes and the app cannot decode the image.

The issue is shown in the attached video which runs an example project. The example project is also attached to this feedback.

I would expect that the intent didn't differ depending on where in the Shortcuts app the user ran the shortcut from.