# UIDocumentBrowserViewController should have a setting to show hidden files and folders

With the iPhone and iPad being used to perform increasingly complex and niche tasks, it would be great to allow UIDocumentBrowserViewController to show hidden files and folders.

I imagine that such setting could be enabled with a property named `shouldShowHiddenItems`, similar to the existing `shouldShowFileExtensions` property.

The new property would be a great benefit for developer focused apps, where people often have to deal with hidden files and folders. Examples of such items include .gitignore, .swiftlint.yml, .nova, and more.

Apps that use this property would usually be those in the Developer Tools category on the App Store. An example of this includes my Runestone app, a plain text editor for iPhone and iPad. Users are asking me to support showing hidden files and folders but since the app uses UIDocumentBrowserViewController, I am unable to support this.