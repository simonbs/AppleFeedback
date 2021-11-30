# Different instances of UIKeyboardLayoutGuide owned by sibling views cannot activate constraints for the same edge

Sibling views that each own a UIKeyboardLayoutGuide through keyboardLayoutGuide introduced in iOS 15 cannot simultaneously activate constraints for the same edge when followsUndockedKeyboard equals true.

1. Add two sibling views to a view.
2. Make each view set constraints using -setConstraints(:activeWhenNearEdge:) and pass the same edge. Here’s an example:

```swift
keyboardLayoutGuide.setConstraints([
    fillView.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -100)
], activeWhenNearEdge: .trailing)
```

3. Run the app on an iPad.
4. Observe that only one view adjusts its constraints.

Please see the attached video and example project. The video is a screen recording of the app built by the example project.

The example app has three tabs with similar content but different behaviours:

1. In the first tab the left-hand view (purple) adjusts its bottom upwards when the floating keyboard (shortcuts bar) is placed in the bottom right corner. The right-hand (orange) does not adjust its bottom.
2. In the second tab the left-hand view (purple) does not adjust its bottom. The right-hand (orange) does adjust its bottom upwards when the floating keyboard (shortcuts bar) is placed in the bottom right corner.
3. In the third tab both views are configured to adjust their bottom upwards when the keyboard (shortcuts bar) is placed in the bottom right corner, however, only the right-hand (orange) view adjusts its bottom.

I would expect both views to adjust their bottom in the third case.

Note that the two views (purple and orange) shows an object address. This is the address of the keyboard layout guide associated with the view.