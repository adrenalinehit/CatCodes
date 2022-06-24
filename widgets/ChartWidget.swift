//
//  ChartWidget.swift
//  widgetsExtension
//
//  Created by Nick Payne on 24/06/2022.
//

import WidgetKit
import SwiftUI

struct ChartWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> ChartWidgetEntry {
        ChartWidgetEntry(date: Date())
    }

    func getSnapshot(in context: Context, completion: @escaping (ChartWidgetEntry) -> Void) {
        let entry = ChartWidgetEntry(date: Date())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        /*FavouriteImageProvider.randomFavouriteImage { favImageResponse in
            var entries: [ChartWidgetEntry] = []
            var policy: TimelineReloadPolicy
            var entry: FavouriteWidgetEntry

            switch favImageResponse {
            case .failure:
                entry = FavouriteWidgetEntry(date: Date(), image: UIImage(named: "Error")!)
                policy = .after(Calendar.current.date(byAdding: .minute, value: 15, to: Date())!)
            case .success(let image):
                entry = FavouriteWidgetEntry(date: Date(), image: image)
                policy = .after(Calendar.current.date(byAdding: .minute, value: 60, to: Date())!)
            }

            entries.append(entry)

            let timeline = Timeline(entries: entries, policy: policy)
            completion(timeline)
        }*/
    }
}

struct ChartWidgetEntry: TimelineEntry {
    let date: Date
    
}

struct ChartWidgetView: View {
    var entry: ChartWidgetProvider.Entry

    var body: some View {
      Text("stuff here")
    }
}

struct ChartWidget: Widget {
    let kind: String = "charts"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: ChartWidgetProvider()) { entry in
            ChartWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .accessoryRectangular])
        .configurationDisplayName("HTTP Codes Chart")
        .description("Widget to show favourites by animal.")
    }
}

struct ChartWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        ChartWidgetView(entry: ChartWidgetEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
