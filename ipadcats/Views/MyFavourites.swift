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
        VStack {
            if appPrefs.codeFavourites.isEmpty {

                Text("Oops, you've not chosen any favourites yet...")
                    .multilineTextAlignment(.center)
                    .padding(.all)

            } else {
                GeometryReader { geometry in
                    VStack(alignment: .center) {
                        Spacer()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(appPrefs.codeFavourites.sorted(by: { return $0.code < $1.code }), id: \.self) { fav in
                                    FavouriteMeme(statusCode: fav.code, animalType: fav.animal).frame(width: geometry.size.width)
                                }
                            }
                        }
                        Spacer()
                    }
                }
            }
        }.navigationBarTitle(Text("My Favourites"))

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
