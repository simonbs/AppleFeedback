# extensionContext.hostedViewMaximumAllowedSize is significantly greater than actual maximum view size on iPad

The extensionContext.hostedViewMaximumAllowedSize property of a INUIHostedViewControlling is not correct on iPad. Tested on iPad Pro 12.9" 2018.
In landscape the value is 1350 x 1024 but the view can be a maximum of 656 x 1024. In portrait the value is 1008 x 1366 but the view cen ba maximum of 656 x 1366. On iPhone the issue does not seem to be present. Tested on iPhone X.

This is an issue when relying on the maximum size of the view to determine the desired size, e.g. when showing an image and wanting to respect aspect ratio while still filling the maximum width the intents UI.

See the attached sample project which shows the issue. Register a shortcut and then trigger it. The attached videos are of the example app and also shows the issue.

Steps to Reproduce:

1. Create a Siri Shortcut with a custom intent.
2. Create an Intents extension that handles your custom intent.
3. Create an IntentsUI extension that handles your custom intent.
4. In configureView(for:of:) provide the value of extensionContext.hostedViewMaximumAllowedSize as the desired size when calling your completion handler.
5. Examine the value of extensionContext.hostedViewMaximumAllowedSize and notice that it is significantly greater than the actual size of your view. I've used viewDidLayoutSubviews to examine the actual size of the view.