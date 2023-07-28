# Ornaments don't affect the safe area insets of layout margins of their associated view

Ornaments on a UIViewController don’t affect the safe area insets or layout margins of their associated views. This is a problem when configuring an ornament to overlap the associated view by setting contentAlignment to .center, which seems common for toolbars on visionOS.

The attached example project shows a UITextView with an overlapping toolbar. The text in the text view cannot become fully readable as the ornament obstructs the text.

The attached screenshot shows the example project.