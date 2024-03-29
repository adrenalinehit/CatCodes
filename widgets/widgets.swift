//
//  widgets.swift
//  widgets
//
//  Created by Nick Payne on 31/05/2022.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), image: UIImage(named: "waiting")!)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), image: UIImage(named: "waiting")!)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        FavouriteImageProvider.randomFavouriteImage { favImageResponse in
            var entries: [SimpleEntry] = []
            var policy: TimelineReloadPolicy
            var entry: SimpleEntry

            switch favImageResponse {
            case .failure:
                entry = SimpleEntry(date: Date(), image: UIImage(named: "Error")!)
                policy = .after(Calendar.current.date(byAdding: .minute, value: 15, to: Date())!)
            case .success(let image):
                entry = SimpleEntry(date: Date(), image: image)
                policy = .after(Calendar.current.date(byAdding: .minute, value: 60, to: Date())!)
            }

            entries.append(entry)

            let timeline = Timeline(entries: entries, policy: policy)
            completion(timeline)
        }
    }

    struct SimpleEntry: TimelineEntry {
        let date: Date
        let image: UIImage
    }

    struct WidgetsEntryView: View {
        var entry: Provider.Entry

        var body: some View {
            Image(uiImage: entry.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
        }
    }

    @main
    struct Widgets: Widget {
        let kind: String = "widgets"

        var body: some WidgetConfiguration {
            StaticConfiguration(kind: kind, provider: Provider()) { entry in
                WidgetsEntryView(entry: entry)
            }
            .supportedFamilies([.systemSmall, .systemLarge])
            .configurationDisplayName("HTTP Codes Random Favourite")
            .description("Widget to show a random favourite meme.")
        }
    }

    struct Widgets_Previews: PreviewProvider {
        static var previews: some View {
            WidgetsEntryView(entry: SimpleEntry(date: Date(), image: UIImage(systemName: "placeholdertext.fill")!))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
