//
//  FavouriteButton.swift
//  ipadcats
//
//  Created by Nick Payne on 23/06/2022.
//

import SwiftUI
import WidgetKit

struct FavouriteButton: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var statusCode = 404
    var animalType = AnimalType.cat
    var textLabel = true
    
    var body: some View {
        Button {
            favouriteItem()
        } label: {
            if textLabel {
                appPrefs.isFavourite(animal: animalType, code: statusCode) ? Label("Favourite", systemImage: "star.fill") : Label("Favourite", systemImage: "star")
            } else {
                appPrefs.isFavourite(animal: animalType, code: statusCode) ? Label("", systemImage: "star.fill") : Label("", systemImage: "star")
            }
        }
    }

    func favouriteItem() {
        appPrefs.favourite(animal: animalType, code: statusCode)
        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
        impactMed.impactOccurred()
        WidgetCenter.shared.reloadAllTimelines()
    }

}

struct FavouriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteButton().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
