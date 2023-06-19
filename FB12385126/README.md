# Swift Charts crashes when using the chartXVisibleDomain view modifier

Sometimes an app may crash when using the charXVisibleDomain view modifier on a chart created with Swift Charts.

I have verified that removing the view modifier and keeping all other code intact and testing with the same dataset in the graph makes the issue disappear.

I have also verified that the length provided to the view modifier is correct and as expected. The length spans over a calendar month.

I have attached the stacktrace.

**Comment**

When waiting until after onAppear() to activate the chartXVisibleDomain view modifier, I’m able to get the following error in the console:

SwiftUI/Layout.swift:1489: Fatal error: view origin is invalid: (nan, 109.79635416666667), UnitPoint(x: 0.0, y: 0.0), (638.0, 215.47031249999998)

For context the length of the visible domain is 2591999 and the scroll position is 707270400.

**Comment**

If I omit my .chartScrollPosition(…) view modifier but keep the .chartXVisibleDomain(…) then the app does not crash either but the combination of these two view modifiers causes the app to crash on one of my charts.

However, passing the exact same values for the two view modifiers in the same chart but displaying a different dataset, does not cause the app to crash. So it seems to be a combination of the following that causes the crash:

1. The .chartXVisibleDomain(…) view modifier.
2. The .chartScrollPosition(…) view modifier.
3. The dataset displayed in the graph.

**Comment**

I have attached a minimal example project to reproduce the issue. The attached image is a screenshot of the sample project.

<img src="https://github.com/simonbs/AppleFeedback/blob/main/FB12385126/screenshot.PNG?raw=true" width="393"/>
