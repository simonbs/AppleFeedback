import Foundation

struct DateRange: Equatable {
    let startDate: Date
    let endDate: Date

    init(from date: Date = Date()) {
        let (startDate, endDate) = Self.dateRange(for: date, interval: .month, in: .current)
        self.startDate = startDate
        self.endDate = endDate
    }

    private init(startDate: Date, endDate: Date) {
        self.startDate = startDate
        self.endDate = endDate
        assert(startDate <= endDate, "Start date must be before end date")
    }
}

extension DateRange {
    private static func dateRange(
        for date: Date,
        interval component: Calendar.Component,
        in calendar: Calendar
    ) -> (startDate: Date, endDate: Date) {
        let today = calendar.startOfDay(for: date)
        let dateInterval = calendar.dateInterval(of: component, for: today)!
        let startDate = dateInterval.start
        let endDateComponents = DateComponents(second: -1)
        let endDate = calendar.date(byAdding: endDateComponents, to: dateInterval.end)!
        return (startDate, endDate)
    }
}
