# UIKeyCommand with shortcut CMD+ isn't shown in list of supported shortcuts

UIKeyCommands with the keyboard shortcut CMD+ (Command key and the plus character) isn’t shown in list of supported shortcuts when holding down the CMD key, however, the action is triggered when performing the shortcut.

The attached example project shows the issue. I’ve tried various values for allowsAutomaticMirroring, allowsAutomaticLocalization and wantsPriorityOverSystemBehavior but with the same result: the shortcut isn’t shown in the list of supported shortcuts.

The problem can be reproduced in the attached example project by following these steps:

1. Run the app on an iPad with a hardware keyboard attached.
2. Hold down the command key (⌘) until the list of supported shortcuts is shown.
3. Observe that the "Increase Font Size" command that is bound to ⌘ + isn't shown in the list but the "Decrease Font Size" command that is bound to ⌘ - is shown.
4. Also observe that the ⌘ + shortcut does in fact trigger the "Increase Font Size" command even though it isn't shown in the list of supported shortcuts.
