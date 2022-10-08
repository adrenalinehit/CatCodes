//
//  TabbedUIView.swift
//  ipadcats
//
//  Created by Nick Payne on 08/10/2022.
//

import SwiftUI

struct TabbedUIView: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var body: some View {
        TabView {
            MyFavourites()
                .tabItem {
                    Label("Favourites", systemImage: "list.dash")
                }

            GridView()
                .tabItem {
                    Label("Selection", systemImage: "square.and.pencil")
                }

            AllHttpCodes()
                .tabItem {
                    Label("All", systemImage: "square.and.pencil")
                }
        }
    }
}

struct TabbedUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedUIView()
    }
}
