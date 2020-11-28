## Value of properties in an intent response is not shown when using Siri in other languages than English

When running a third-party Shortcuts action which has a response that contains a custom property, the value of the property is not shown when using Siri in a language other than English, e.g. Danish or German. When running the action in Danish or German, Siri will omit the property.

I had the exact same problem a few years ago. Back then the issue was fixed by localizing the intent definition into all languages supported by Siri. So in the above case, adding localizations for Danish and German would be sufficient. However, this no longer fixes the issue as demonstrated by the attached sample project.

The example project contains a Shortcuts action called "Test Language". The intent definition containing the action is localzied into English, Danish and German. I cheated a bit and kept the Danish and German strings the same as the English strings.

The issue can be reproduced in the example app by following these steps:

1. Go to the Shortcuts app and create a shortcut. Add the "Test Language" action.
2. Have your language for Siri set to English (United States).
3. Run your newly created shortcut using Siri.
4. Notice that Siri says "OK, done." followed by a long message.
5. Set the language for Siri to Danish.
6. Run the shortcut again.
7. Notice that Siri says "OK, udført" but omits the long message.

Since the intent definition is localized into English, Danish and German, I would expect the value of the property to be shown in all three languages.

The attached screenshots shows the difference between running the shrotcut with Siri set to English and Danish.

|-|-|
|<img width="375" src="https://raw.githubusercontent.com/simonbs/AppleFeedback/master/FB8920651/screenshot1.PNG"/>|<img width="375" src="https://raw.githubusercontent.com/simonbs/AppleFeedback/master/FB8920651/screenshot3.PNG"/>|
