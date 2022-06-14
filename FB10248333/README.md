# We need an 'Add Widget' button to onboard users to an app's widgets

Informing users that an app supports widgets and how they can add the widgets to their Home Screen, or Lock Screen starting from iOS 16, is difficult.

I’m suspecting that many users won’t check the widget library to see if an app supports widgets after installing it. One way to solve this is to show an onboarding flow in the app informing the users about the widgets. However, such onboarding flow needs a call to action that lets the users add a widget to their Home Screen or Lock Screen. The best we can do now is to write the steps a user must take to add a widget themselves, and that requires quite a few steps and as such, there’s a risk that the user finds it too cumbersome or forgets the steps and as such end up not using our widgets.

I strongly believe that WidgetKit should offer an ‘Add Widget’ button that lets users initiate a flow to add a widget to their Home Screen or Lock Screen directly from within an app and ideally without leaving the app. This is very much in line with the ‘Add to Siri’ button that Shortcuts had when launching.