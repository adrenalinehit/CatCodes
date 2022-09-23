//
//  SideView.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct SidebarView: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var body: some View {
        NavigationView {
            List {
                
                AnimalSwitcher(appPrefs: _appPrefs)
                
                NavigationLink(destination: AllHttpCodes()) {
                    Label("All HTTP Status Codes", systemImage: "list.bullet.rectangle")
                }

                NavigationLink(destination: MyFavourites()) {
                    Label("My Favourites", systemImage: "list.bullet.rectangle")
                }

                NavigationLink(destination: GridView()) {
                    Label("Random Selection", systemImage: "list.bullet.rectangle")
                }
                
                NavigationLink(destination: RandomCode()) {
                    Label("Random Status Code", systemImage: "shuffle")
                }

            }

            .listStyle(SidebarListStyle())
            .navigationTitle("HTTP Codes")

            GridView()
            //MyFavourites()
            //RandomCode()
        }

    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
            .previewInterfaceOrientation(.landscapeLeft)
            .environmentObject({ () -> AppPreferences in
                let envObj = AppPreferences()
                envObj.animalPreference = .cat
                return envObj
            }() )
    }
}
