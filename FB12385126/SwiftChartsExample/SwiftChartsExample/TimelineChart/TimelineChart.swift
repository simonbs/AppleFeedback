import Charts
import SwiftUI

struct TimelineChart: View {
    @State private var data: [ChartDataPoint] = []
    @State private var scrollPosition: TimeInterval
    private let enableTroublesomeViewModifiers: Bool
    private let axisXVisibleDomain: TimeInterval
    private var axisXDomain: ClosedRange<Date> {
        guard !data.isEmpty else {
            let dateRange = DateRange()
            return dateRange.startDate ... dateRange.endDate
        }
        let startDateRange = DateRange(from: data[0].valueX)
        let endDateRange = DateRange()
        return startDateRange.startDate ... endDateRange.endDate
    }
    private var hasData: Bool {
        !data.isEmpty
    }

    init(enableTroublesomeViewModifiers: Bool) {
        let dateRange = DateRange()
        self._scrollPosition = State(initialValue: dateRange.startDate.timeIntervalSinceReferenceDate)
        self.axisXVisibleDomain = dateRange.endDate.timeIntervalSince(dateRange.startDate)
        self.enableTroublesomeViewModifiers = enableTroublesomeViewModifiers
    }

    var body: some View {
        if enableTroublesomeViewModifiers {
            // 💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥
            // 💥 THIS CODE PATH CAUSES THE APP TO CRASH.
            // 💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥💥
            makeChart()
                .chartXVisibleDomain(length: axisXVisibleDomain)
                .chartScrollPosition(x: $scrollPosition)
        } else {
            makeChart()
        }
    }
}

private extension TimelineChart {
    @ViewBuilder
    private func makeChart() -> some View {
        Chart {
            if !data.isEmpty {
                ForEach(data) { dataPoint in
                    BarMark(
                        x: .value("Date", dataPoint.valueX, unit: .day),
                        y: .value("Value", dataPoint.valueY)
                    )
                    .foregroundStyle(Color.accentColor)
                }
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXScale(domain: axisXDomain)
        .chartScrollTargetBehavior(
            .valueAligned(
                matching: .init(hour: 0, minute: 0, second: 0),
                majorAlignment: .matching(.init(day: 1))
            )
        )
        .chartXAxis {
            AxisMarks(values: .stride(by: .day, count: 7)) { _ in
                AxisGridLine()
                AxisValueLabel(format: .dateTime.day())
            }
        }
        .aspectRatio(5 / 4, contentMode: .fit)
    }
}

#Preview {
    TimelineChart(enableTroublesomeViewModifiers: false)
}
