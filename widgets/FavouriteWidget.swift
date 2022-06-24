//
//  widgets.swift
//  widgets
//
//  Created by Nick Payne on 31/05/2022.
//

import WidgetKit
import SwiftUI

struct FavouriteWidgetProvider: TimelineProvider {
    func placeholder(in context: Context) -> FavouriteWidgetEntry {
        FavouriteWidgetEntry(date: Date(), image: UIImage(named: "waiting")!)
    }

    func getSnapshot(in context: Context, completion: @escaping (FavouriteWidgetEntry) -> Void) {
        let entry = FavouriteWidgetEntry(date: Date(), image: UIImage(named: "waiting")!)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        WidgetDataProvider.randomFavouriteImage { favImageResponse in
            var entries: [FavouriteWidgetEntry] = []
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
        }
    }
}

struct FavouriteWidgetEntry: TimelineEntry {
    let date: Date
    let image: UIImage
}

struct FavouriteWidgetView: View {
    var entry: FavouriteWidgetProvider.Entry

    var body: some View {
        Image(uiImage: entry.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct FavouriteWidget: Widget {
    let kind: String = "favourites"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: FavouriteWidgetProvider()) { entry in
            FavouriteWidgetView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemLarge, .accessoryRectangular])
        .configurationDisplayName("HTTP Codes Random Favourite")
        .description("Widget to show a random favourite meme.")
    }
}

struct FavouriteWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteWidgetView(entry: FavouriteWidgetEntry(date: Date(), image: UIImage(systemName: "placeholdertext.fill")!))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
