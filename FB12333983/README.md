# Annotations are not shown when selecting values in a scrollable chart

The annotation on a RuleMark in a chart is not shown when the chart is scrollable.

I have followed the instructions in the WWDC session “Explore pie charts and interactivity in Swift Charts” to make my chart scrollable and add selection to show a rule mark and an annotation on the selected data point. However, only the rule mark is shown and the annotation is not shown.

Attached you will find a tiny sample project that illustrates this issue. The sample project shows a chart and a toggle to enable/disable scrolling in the chart. Only when scrolling is disabled will the annotation on the RuleMark be shown when selecting a data point in the chart.

The attached screen recording shows the issue using the attached sample project.