# Provided file is not part of the intent if it was selected

When running an intent with a file selected from a list of provided files, the file parameter has a nil value. However, the same parameter is correctly given a value when using a file that is not provide by the intent, eg. a dictionary created in the shortcut.

1. Create an intent that has a file parameter for which the intent dynamically provides values
2. In the intent, provide at least one file for the parameter
3. Attempt to use the file parameter when actually handling the intent
4. Use the shortcut in Shortcuts.
5. Select the provided file.
6. Run the shortcut.
7. With a breakpoint in the function handling the intent, notice that the file parameter has no value.