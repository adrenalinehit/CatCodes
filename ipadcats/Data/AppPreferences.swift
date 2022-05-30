//
//  AnimalPreferences.swift
//  ipadcats
//
//  Created by Nick Payne on 28/05/2022.
//

import Foundation

class AppPreferences: ObservableObject {
    @Published var animalPreference = AnimalType.cat
    @Published var codeFavourites: Set<Favourite> = []
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Favourites") {
            if let decoded = try? JSONDecoder().decode(Set<Favourite>.self, from: data) {
                codeFavourites = decoded
                return
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
        
        if codeFavourites.contains(favouriteItem){
            codeFavourites.remove(favouriteItem)
            save(favs: codeFavourites)
        } else {
            codeFavourites.insert(favouriteItem)
            save(favs: codeFavourites)
        }
        
    }
    
    func save(favs: Set<Favourite>) {
        if let encoded = try? JSONEncoder().encode(favs) {
            UserDefaults.standard.set(encoded, forKey: "Favourites")
        }
    }
    
}
