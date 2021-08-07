# Functions and variables added with evaluateJavaScript() aren't available after a page load on iOS 15

Evaluating JavaScript that defines functions and variables using webView.evaluateJavaScript(myJavaScript) would mean that those functions and variables were available after each page had been loaded on iOS 14.

For example evaluating the following JavaScript meant that the completion(value) function was available, even after a new page had been loaded in the network.

```
let js = `
const completion = function(value) {
	window.webkit.messageHandlers.myCompletionHandler.postMessage(value)
}
`
```

On iOS 15 the completion(value) function is no longer available once a page has been loaded.

As a workaround I have found that evaluating the above JavaScript each time -webView(:didFinish) is called will ensure that the completion(value) function is always available.

I would not expect this behaviour of -webView.evaluateJavaScript(:) to change from iOS 14 to iOS 15 but it appears that it has.

> Here’s a small clarification. When I say that the functions and variables added with webView.evaluateJavaScript(:) is “no longer available” after the page load, I mean that the functions and variables are no longer available to subsequent calls to webView.evaluateJavaScript(:) on iOS. However, they are available to subsequent calls on iOS 14.