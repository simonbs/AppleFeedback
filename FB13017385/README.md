# UITextInput's -setAttributedMarkedText(_:selectedRange:) should receive an attributed string that contains information about its purpose

Starting from iOS 17, UITextInput’s `-setAttributedMarkedText(_:selectedRange:)` function is called when the inline prediction has been enabled by setting `inlinePredictionType = .yes`. However, there is no way to know whether `-setAttributedMarkedText(_:selectedRange:)` was called in order to handle inline prediction or to handle some other marked text, for example when the user is typing using a multi-stage input.

I understand the motivation for repurposing the existing API to handle the inline prediction and fortunately, this is still possible even when supplying this information as the NSAttributedString’s attributes could contain a custom key that defines it’s purpose. See the code snippet below for an example.

```swift
extension NSAttributedString.Key {
    static let isInlinePrediction = NSAttributedString.Key("isInlinePrediction")
}

let markedText = NSAttributedString(string: "is good", attributes: [
    .foregroundColor: UIColor.systemGray,
    .isInlinePrediction: true
])
let selectedRange = NSRange(location: 5, length: 0)
textInput.setAttributedMarkedText(markedText, selectedRange: selectedRange)
```
