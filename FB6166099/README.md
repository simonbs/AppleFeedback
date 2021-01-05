# Confusing behaviour when dragging windows and -tableView:dragSessionIsRestrictedToDraggingApplication: returns false

Dragging and dropping a cell to create a new window in iPadOS 13 becomes disable when -tableView:dragSessionIsRestrictedToDraggingApplication: returns false. This seem to be either a bug or confusing behavior. Returning false from -tableView:dragSessionIsRestrictedToDraggingApplication: indicates that the items in the session cannot be dragged to other applications, however creating a new window does not involve any other application, at least not from a developers point of view.

If the current behaviour is intended, I believe a more appropriate name for the method would be something along the lines of -tableView:dragSessionIsRestrictedToDraggingWindow: given the recent changes in iPadOS 13.

The same applies for the UICollectionView variant, -collectionView:dragSessionIsRestrictedToDraggingApplication: 

The attached sample project shows the difference in behaviour based on the returned value of the delegate method.