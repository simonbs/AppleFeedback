# Actions that return a boolean value will crash the Shortcuts app

Actions that return a boolean will crash the Shortcuts app when the shortcut is running whole the editor is open. Please see the attached example project.

After installing the app built by the attached sample project, the issue can be replicated by following the steps below.

1. Open the Shortcuts app
2. Create a new and shortcut with no actions
3. Add the "Get Boolean Value" action offered by this app.
4. Run the shortcut with the editor open.
5. Notice that the Shortcuts app crashed 💥

You may also test it with the shortcut at this link: https://www.icloud.com/shortcuts/951b56545ca4494d99b0f966832df6bc