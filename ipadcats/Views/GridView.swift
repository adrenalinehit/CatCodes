//
//  GridView.swift
//  ipadcats
//
//  Created by Nick Payne on 23/09/2022.
//

import SwiftUI

struct GridView: View {

    @EnvironmentObject var appPrefs: AppPreferences

    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach((0...25), id: \.self) {_ in

                        MyImage(animalType: appPrefs.animalPreference, statusCode: HTTPStatusCode.allCases.randomElement()!.rawValue).frame(height: 200)
                    }
                }
            }
        .navigationBarTitle(Text("25 randoms"))
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
