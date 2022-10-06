//
//  AnimalPreferences.swift
//  ipadcats
//
//  Created by Nick Payne on 28/05/2022.
//

import Foundation
import ipadcats_data

class AppPreferences: ObservableObject {
    @Published var animalPreference = AnimalType.cat
    @Published var codeFavourites: Set<Favourite> = []
    @Published var favouriteCount = 0

    private let ukvs = NSUbiquitousKeyValueStore.default

    init() {

        ukvs.synchronize()

        if ukvs.bool(forKey: "backedup") == false {
            print("attempting one time back up of your favourites")
            if let existing = UserDefaults(suiteName: "group.uk.co.enyapkcin.ipadcats")!.data(forKey: "Favourites") {
                if let decoded = try? JSONDecoder().decode(Set<Favourite>.self, from: existing) {
                    codeFavourites = decoded
                    self.save(favs: decoded)
                    ukvs.set(true, forKey: "backedup")
                    ukvs.synchronize()
                    return
                }
            }
        } else {
            if let data = ukvs.data(forKey: "Favourites") {
                print("init: \(data)")
                if let decoded = try? JSONDecoder().decode(Set<Favourite>.self, from: data) {
                    codeFavourites = decoded
                    return
                }
            }
        }
        codeFavourites = []
    }
}

extension AppPreferences {
    func isFavourite(animal: AnimalType, code: Int) -> Bool {
        let favourite = Favourite(code: code, animal: animal)

        return codeFavourites.contains(favourite)
    }

    func favourite(animal: AnimalType, code: Int) {
        let favouriteItem = Favourite(code: code, animal: animal)

        if codeFavourites.contains(favouriteItem) {
            codeFavourites.remove(favouriteItem)
            save(favs: codeFavourites)
        } else {
            codeFavourites.insert(favouriteItem)
            save(favs: codeFavourites)
            favouriteCount += 1
        }

    }

    func save(favs: Set<Favourite>) {
        if let encoded = try? JSONEncoder().encode(favs) {
            print("encoded: \(encoded)")
            ukvs.set(encoded, forKey: "Favourites")
            ukvs.synchronize()
        }
    }

}
