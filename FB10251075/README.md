# Document-based apps can become the default app for some plain text file types but not all

Document-based apps can become the default app for plain text file types like Shell scripts, JSON files, and HTML files but not, for example, JavaScript files. When selecting a file, the Files app will show a quick look preview of JavaScript files while it’ll open the document in the document-based app for Shell scripts, JSON files, HTML files, and more. This provides an inconsistent experience for users, and frankly, showing a quick look preview can seem useless if the user have an app installed that can handle this properly.

This poses a problem in my app Runestone, a plain text editor for iPhone and iPad with support for syntax highlighting for a various of languages. Users expect that it can handle all plain text file types but it cannot do that due to limitations in iOS.

I have tested a setup where I have the following document types registered in my app.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<array>
  <dict>
    <key>CFBundleTypeName</key>
    <string>Plain Text</string>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>LSHandlerRank</key>
    <string>Alternate</string>
    <key>LSItemContentTypes</key>
    <array>
      <string>public.plain-text</string>
    </array>
  </dict>
  <dict>
    <key>CFBundleTypeName</key>
    <string>JSON</string>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>LSHandlerRank</key>
    <string>Alternate</string>
    <key>LSItemContentTypes</key>
    <array>
      <string>public.json</string>
    </array>
  </dict>
  <dict>
    <key>CFBundleTypeName</key>
    <string>Item</string>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>LSHandlerRank</key>
    <string>Alternate</string>
    <key>LSItemContentTypes</key>
    <array>
      <string>public.item</string>
    </array>
  </dict>
</array>
</plist>


I have also tested a setup where I have the com.netscape.javascript-source UTI registered as well but that did not make any difference.
