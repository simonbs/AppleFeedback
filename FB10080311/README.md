# Buttons on the screen don't receive touches when UIMenuController or UIEditMenuInteraction presents a menu

Starting from iOS 16, buttons on the screen don’t receive touches when a UIMenuController (nay, a menu of a UIEditMenuInteraction) is presented. When attempting to select a button on the screen that’s outside of the menu, the menu will be dismissed but the selected button will not receive the touches. This is a change from iOS 15 that seems unintentional.

The behavior in iOS 16 poses a problem in my app that lets users select some text, in which case the UIMenuController may be shown, and act on that selected text by selecting a button on the screen.