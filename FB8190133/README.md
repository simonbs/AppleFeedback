# Outline collection view cells only expand when the view controller hosting the collection view is embedded in a navigation controller

When using the new iOS 14 outlines in UICollectionView, the sections will only expand when the view controller hosting the collection view is embedded in a navigation controller. Otherwise nothing happens when tapping the outline disclosure indicator.

The attached sample project contains a ListViewController which has a collection view with outlines. Two instances of the ListViewController is used in the sample project to show the difference in behavior when embedding the view controller in a navigation controller and when not doing so.

The root view controller is a UITabBarController that holds the two instances of ListViewController.

- The first tab is called "Not Working". The tab contains a ListViewController but does not embed it in a UINavigationController. When tapping a section header, the outlines does not expand.
- The second tab is called "Works". The tab contains another ListViewController that is embedded in a UINavigationController. When tapping a section header, the outline properly expands.

I would expect the behavior of the outlines to be the same no matter if the view controller hosting the collection view is embedded in a UINavigationController or not.