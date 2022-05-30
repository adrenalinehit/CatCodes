//
//  MyFavourites.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import SwiftUI

struct MyFavourites: View {
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var body: some View {
        
        List {
            ForEach(appPrefs.codeFavourites.sorted(by: >), id: \.self) { fav in
                Meme(statusCode: fav.code, animalType: fav.animal)
            }
        }
        .overlay(Group {
            if appPrefs.codeFavourites.isEmpty {
                Text("Oops, you've not chosen any favourites yet...")
            }
        })
    }
}

struct MyFavourites_Previews: PreviewProvider {
    static var previews: some View {
        MyFavourites().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
