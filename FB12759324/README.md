# Resizing a window containing a UIDocumentBrowserViewController is extremely poor performance on Vision Pro

Resizing a window that contains a UIDocumentBrowserViewController on visionOS has extremely poor performance. The performance is poor both when the UIDocumentViewController is topmost but also when a view controller is presented on top of the UIDocumentBrowserViewController.

Please see the attached video that demonstrates the poor performance. The video also shows resizing the Freeform app for a comparison.

The attached sample project can be used to reproduce the issue. The video is a recording of the sample project.