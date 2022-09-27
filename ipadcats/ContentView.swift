//
//  ContentView.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var body: some View {
        NavigationSplitView {
            SidebarView().environmentObject(appPrefs)
        } detail: {
            MyFavourites().environmentObject(appPrefs)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
