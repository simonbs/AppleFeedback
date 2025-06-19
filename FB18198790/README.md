# Toolbar items that do not contain a button still appear interactive

A toolbar button created with the snippet below will appear interactive on iOS 26, e.g. it will adjust its appearance when touched, even though it contains no interactive element.

The issue can be reproduced using the attached example project.

```swift
.toolbar {
    ToolbarItem(placement: .bottomBar) {
        Text("Why is this interactive?")
            .padding(.horizontal)
            .fixedSize()
    }
}
```
