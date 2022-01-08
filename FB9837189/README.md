# Input accessory views isn't animated out of the screen when dismissing a keyboard interactively

When editing a text view that has an input accessory view and has keyboardDismissMode = .interactive, the input accessory view isn’t properly moved out of the bottom of the screen with the keyboard. The input accessory view will instead stop moving when it reaches the bottom of the screen.

Reproduce this issue by:
1. Create a UITextView.
2. Assign it an input accessory item to be shown above the keyboard when editing the text in the text view.
3. Set keyboardDismissMode = .interactive on the text view.
4. Run the app and start editing the text in the text view.
5. Interactively dismiss the keyboard by dragging down.
6. Notice that the input accessory view isn’t moved out of the screen.

The attached example project demonstrates the issue.

There are two screen recordings attached to this issue. One screen recording shows the issue in the example project, and another shows that the Notes app somehow got the behavior correct.

I’ve heard from other developers who are seeing the same issue. For example Simeon (@twolivesleft) on Twitter: https://twitter.com/twolivesleft/status/1479760639304212487
