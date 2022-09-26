//
//  Credits.swift
//  ipadcats
//
//  Created by Nick Payne on 24/09/2022.
//

import SwiftUI
import Nuke

struct Credits: View {
    var body: some View {
        ScrollView {
            VStack {
                Text("Images").font(.largeTitle).fontWeight(.semibold).padding(.all)
                Text("Thanks to Fili Wiese for the images and inspiration behind this app. He in no way endorses this app, nor was involved with its development.").padding(.all)
                Text("Find out more about Fili's work here:")

                HStack {
                    Link("http.dev", destination: URL(string: "https://http.dev")!).myCreditsLink()

                    Link("httpcats.com", destination: URL(string: "https://httpcats.com")!).myCreditsLink()
                }

                HStack {
                    Link("http.dog", destination: URL(string: "https://http.dog")!).myCreditsLink()

                    Link("http.garden", destination: URL(string: "https://http.garden")!).myCreditsLink()
                }

                Spacer()

                Text("Options").font(.title2)

                Button {
                    clearCaches()
                } label: {
                    Label("Clear image caches", systemImage: "trash")
                }.myCreditsLink()
            }

        }.navigationBarTitle(Text("Credits"))
    }

    func clearCaches() {
        try? Nuke.DataCache(name: "uk.co.enyapkcin.ipadcats.datacache").removeAll()
        Nuke.DataLoader.sharedUrlCache.removeAllCachedResponses()
    }
}

struct Credits_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
}
