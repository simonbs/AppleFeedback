# Input accessory view is attached to the window, not the keyboard on visionOS

The inputAccessoryView property on UITextView and UITextField is used to attach a view to the keyboard on iOS and iPadOS. However, on visionOS the view assigned to inputAccessoryView is attached to the bottom of the window hosting the text view or text field, much like an ornament.

This is not what the user expects and these controls should be located near the keyboard.

The issue is shown in the attached recording of the Vision Pro simulator and can be reproduced using the attached sample project.

<img width="720" src="https://github.com/simonbs/AppleFeedback/blob/main/FB12965280/screenshot.png?raw=true"/>
