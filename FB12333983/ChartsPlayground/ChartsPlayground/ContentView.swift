import SwiftUI

struct ContentView: View {
    @State private var scrollPosition: TimeInterval =
        SalesData.last365Days.last!.day.addingTimeInterval(-1 * 3600 * 24 * 30)
        .timeIntervalSinceReferenceDate
    @State private var isChartScrollable = true

    var body: some View {
        VStack(spacing: 40) {
            DailySalesChart(
                isScrollable: isChartScrollable,
                scrollPosition: $scrollPosition
            )
            .aspectRatio(1, contentMode: .fit)
            Toggle(isOn: $isChartScrollable) {
                Text("Scrollable Chart")
            }
            Text("When the chart is scrollable, the annotation is not shown above the RuleMark on the selected day.")
        }
        .padding()
    }
}
