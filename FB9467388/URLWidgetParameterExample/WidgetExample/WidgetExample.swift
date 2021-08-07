//
//  WidgetExample.swift
//  WidgetExample
//
//  Created by Simon Støvring on 07/08/2021.
//

import WidgetKit
import SwiftUI
import Intents
import ExampleKit

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: FavoriteURLIntent())
    }

    func getSnapshot(for configuration: FavoriteURLIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: FavoriteURLIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries = [SimpleEntry(date: Date(), configuration: configuration)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: FavoriteURLIntent
}

struct WidgetExampleEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        Text(entry.configuration.url?.absoluteString ?? "No URL provided.")
    }
}

@main
struct WidgetExample: Widget {
    let kind: String = "WidgetExample"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: FavoriteURLIntent.self, provider: Provider()) { entry in
            WidgetExampleEntryView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

struct WidgetExample_Previews: PreviewProvider {
    static var previews: some View {
        WidgetExampleEntryView(entry: SimpleEntry(date: Date(), configuration: FavoriteURLIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
