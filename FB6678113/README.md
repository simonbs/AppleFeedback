# HKHealthStore not presenting any UI when requesting authorization not is it calling the completion handler passed to -requestAuthorization

When requesting authorization to read data from the users health store using -
requestAuthorization(toShare:read:completion:) the authorization UI is not presented and the callback is not called. 

If I put the app into the background and open it again, the completion handler will be called with the following error:

Error Domain=com.apple.healthkit Code=5 "(null)"

I reproduced the issue at around 08.48 AM.

Please see the example project attached in the comments.