//
//  ipadcatsApp.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//
import Nuke
import SwiftUI

@main
struct IpadcatsApp: App {
    
    @StateObject var appPrefs = AppPreferences()
    
    init() {
        ImagePipeline {
            $0.dataCache = try? DataCache(name: "uk.co.enyapkcin.ipadcats.datacache")
            $0.dataCachePolicy = .automatic
        }
    }
    
    var body: some Scene {
        WindowGroup {
            switch UIDevice.current.userInterfaceIdiom {
            case .phone:
                TabbedUIView().environmentObject(appPrefs)
            default:
                ContentView().environmentObject(appPrefs)
            }
        }
    }
}
