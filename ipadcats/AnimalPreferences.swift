//
//  AnimalPreferences.swift
//  ipadcats
//
//  Created by Nick Payne on 28/05/2022.
//

import Foundation

class AppPreferences: ObservableObject {
    @Published var animalPreference = AnimalType.cat
    
}

enum AnimalType: String, CaseIterable, Identifiable {
    
    var id: Self { self }
    
    case cat = "Cats"
    case dog = "Dogs"
}
