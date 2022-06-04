//
//  TabbedViewHome.swift
//  ipadcats
//
//  Created by Nick Payne on 04/06/2022.
//

import SwiftUI

struct TabbedViewHome: View {

    @EnvironmentObject var appPrefs: AppPreferences
    @State private var selectedTab: Tabs = .all

    var body: some View {
        TabView(selection: $selectedTab) {
            AllHttpCodes().tabItem {
                Label("All", systemImage: "star")
            }
            .tag(Tabs.all)
            MyFavourites().tabItem {
                Label("Favourites", systemImage: "star")
            }
            .tag(Tabs.favourites)
            RandomCode().tabItem {
                Label("Random", systemImage: "star")
            }
            .tag(Tabs.random)
        }
    }
}

struct TabbedViewHome_Previews: PreviewProvider {
    static var previews: some View {
        TabbedViewHome().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
