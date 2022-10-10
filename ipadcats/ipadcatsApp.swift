//
//  ipadcatsApp.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//
import Nuke
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct IpadcatsApp: App {

    @StateObject var appPrefs = AppPreferences()
    @AppStorage("tabbed_preference") var tabbed = false

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

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
                if tabbed {
                    TabbedUIView().environmentObject(appPrefs)
                } else {
                    ContentView().environmentObject(appPrefs)
                }
            default:
                ContentView().environmentObject(appPrefs)
            }
        }
    }
}
