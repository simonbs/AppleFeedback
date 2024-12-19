# Continuous reference to an Observable object in SwiftUI view updates causes linear memory growth

Memory usage grows linearly over time when a SwiftUI view observes a model using the Observation framework and the view updates periodically.

In my ~35 LOC example app, memory usage increases when the SwiftUI view references the isEnabled property of an ObservableSettings object. However, the memory usage remains stable when using a NonObservableSettings object (a plain Swift object that is not Observable).

See the attached example project and Instruments recording for details.

Steps to Reproduce:
1. Create a SwiftUI view that observes an ObservableSettings object.
2. Periodically update the view, e.g., via a timer.
3. Monitor memory usage in Instruments.

Observed Behavior:
Memory usage grows linearly over time.

Expected Behavior:
Memory usage should remain stable regardless of view updates and observing an Observable object.

Environment:
macOS Sequoia 15.2
