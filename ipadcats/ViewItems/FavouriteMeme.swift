//
//  FavouriteMemeView.swift
//  ipadcats
//
//  Created by Nick Payne on 23/06/2022.
//

import SwiftUI

struct FavouriteMeme: View {
    
    @EnvironmentObject var appPrefs: AppPreferences

    var statusCode = 404
    var animalType = AnimalType.cat

    var body: some View {
        VStack {

            MyImage(animalType: animalType, statusCode: statusCode)

            HStack {
                ShareButton(statusCode: statusCode, animalType: animalType)
                FavouriteButton(appPrefs: _appPrefs, statusCode: statusCode, animalType: animalType)
            }
        }
    }
}

struct FavouriteMeme_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteMeme().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
