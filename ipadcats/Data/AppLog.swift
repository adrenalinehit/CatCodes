//
//  AppLog.swift
//  ipadcats
//
//  Created by Nick Payne on 10/10/2022.
//

import Foundation
import FirebaseAnalytics

class AppLog {

    public static func addFavourite(code: String, meme: String) {
        Analytics.logEvent("favourite_added", parameters: [
          "type": meme as NSObject,
          "httpcode": code as NSObject
        ])
    }

    public static func removeFavourite(code: String, meme: String) {
        Analytics.logEvent("favourite_removed", parameters: [
          "type": meme as NSObject,
          "httpcode": code as NSObject
        ])
    }

    public static func share(code: String, meme: String) {
        Analytics.logEvent("meme_shared", parameters: [
          "type": meme as NSObject,
          "httpcode": code as NSObject
        ])
    }
}
