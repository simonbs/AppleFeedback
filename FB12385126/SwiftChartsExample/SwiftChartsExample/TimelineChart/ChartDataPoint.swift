import Foundation

struct ChartDataPoint: Equatable, Identifiable {
    let valueX: Date
    let valueY: Int
    var id: Date {
        valueX
    }

    init(date: Date, value: Int) {
        self.valueX = date
        self.valueY = value
    }
}
