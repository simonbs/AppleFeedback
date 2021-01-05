# Setting isScrollEnabled causes app to hang

I'm seeing a performance issue when setting isScrollEnabled on a text view that shows a big text string. I'm building a text editor that has a boolean property called showLineNumbers.

When setting the property, I temporarily disable scrolling to prevent the contentOffset from being adjusted. This might not be the right way to solve this issue, but nonetheless it surfaces the performance issue. I've attached a screenshot of the code as shown in Instruments after running the Time Profiler instrument.