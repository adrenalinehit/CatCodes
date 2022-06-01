//
//  Favourite.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import Foundation

class Favourite: Codable, Hashable, Comparable {
    
    var code: Int
    var animal: AnimalType
    
    init(code: Int, animal: AnimalType){
        self.code = code
        self.animal = animal
    }
    
    static func == (lhs: Favourite, rhs: Favourite) -> Bool {
        return lhs.animal == rhs.animal && lhs.code == rhs.code
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
        hasher.combine(animal)
    }
    
    static func <(lhs: Favourite, rhs: Favourite) -> Bool {
        return lhs.code < rhs.code && lhs.animal.rawValue < rhs.animal.rawValue
    }
}

enum AnimalType: String, CaseIterable, Identifiable, Codable {
    
    var id: Self { self }
    
    case cat = "Cats"
    case dog = "Dogs"
}
