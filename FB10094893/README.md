# The new -renameDocument(at:proposedName:) method on UIDocumentBrowserViewController doesn't support changing the file extension

Calling the new -renameDocument(at:proposedName:) method on UIDocumentBrowserViewController with a proposed name that includes a file extension doesn’t change the file extension. Instead the existing file extension is appended to the filename.

For example, renaming a file from “Foo.php” to “Hello.js” results in a file named “Hello.js.php”. The attached video shows this issue using the new UINavigationItemRenameDelegate in iPadOS 16. After renaming the file in the UI, the app calls the -renameDocument(at:proposedName:) method to perform the actual renaming.

I understand that it’s difficult to determine if a dot in proposed name represents a file extension or not. To address this I propose extending the function declaration to accept a file extension. Something like -renameDocument(at:proposedName:withFileExtension:). When supplying no file extension, it could default to the existing file extension. Supplying an empty file extension could mean that the file does not have a file extension.