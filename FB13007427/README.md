# UITextInteraction's caret disappears after updating the marked text in UITextInput's -setAttributedMarkedText(_:selectedRange:)

When using a UITextInteraction with a UITextInput and adopting the new inline prediction style, UIKit will call -setAttributedMarkedText(_:selectedRange:) and expects the implementation of UITextInput to ensure the inline prediction is shown and that the markedRange property is updated. After doing this, UITextInteraction’s cursor will disappear from the view.

By examining the view hierarchy using the view debugger it becomes clear that _UITextCursorView and its friends disappear from the view hierarchy entirely.

This issue may be related to FB12622609: “Caret does not show up in view conforming to UITextInput when using UITextInteraction”
