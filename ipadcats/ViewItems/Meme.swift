//
//  Meme.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import SwiftUI
import WidgetKit

struct Meme: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var statusCode = 404
    var animalType = AnimalType.cat

    var body: some View {

        VStack {

            AnimalSwitcher(appPrefs: _appPrefs).padding()

            MyImage(animalType: animalType, statusCode: statusCode)
                .padding()

            HStack {
                ShareButton(statusCode: statusCode, animalType: animalType)
                FavouriteButton(appPrefs: _appPrefs, statusCode: statusCode, animalType: animalType)
            }.padding()
        }
        .navigationTitle(Text("Meme"))

    }
}

struct Meme_Previews: PreviewProvider {
    static var previews: some View {
        Meme().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
