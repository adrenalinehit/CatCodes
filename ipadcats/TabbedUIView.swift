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
                    Label("Favourites", systemImage: "star.square.on.square")
                }

            GridView()
                .tabItem {
                    Label("Selection", systemImage: "square.3.layers.3d.down.right")
                }

            AllHttpCodes()
                .tabItem {
                    Label("All", systemImage: "list.bullet.rectangle")
                }

            RandomCode()
                .tabItem {
                    Label("Random", systemImage: "shuffle")
                }
        }

    }
}

struct TabbedUIView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedUIView()
    }
}
