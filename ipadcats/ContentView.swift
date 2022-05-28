//
//  ContentView.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    //dog or cat?
    @StateObject var appPrefs = AppPreferences()
    
    var body: some View {
        SidebarView()
            .environmentObject(appPrefs)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
