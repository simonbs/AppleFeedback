# Intent parameters of type URL is not persisted

Intent parameters of type URL is not persisted in widgets. Once the parameter is filled out and the widget configurator is dismissed, the parameter value is lost. The value isn’t available to the widget and it isn’t passed to the app when selecting the widget on the Home Screen.

This can be reproduced in the example steps by following the below steps.

1. Install the sample app.
2. Add the sample app’s widget to the Home Screen.
3. Fill out the “Favorite URL” parameter in the widget configurator. Enter a value like https://apple.com or similar.
4. Save the changes by dismissing the widget configurator and returning to the Home Screen.
5. Observe that the widget still says “No URL provided”. The URL is not persisted and as such is not available to the widget extension.
6. Select the widget.
7. Observe that the app says “No URL provided”. The URL is not persisted and as such is not available on the intent in the user activity passed to -scene(:continue:) on the scene delegate.