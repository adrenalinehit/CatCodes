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

    @State private var randoms: [HTTPStatusCode] = []
    
    var body: some View {
        ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(randoms.sorted(by: { return $0.rawValue < $1.rawValue })) { code in

                        MyImage(animalType: appPrefs.animalPreference, statusCode: code.rawValue).frame(height: 200)
                    }
                }
        }.onAppear {
            pickRandoms()
        }
        .navigationBarTitle(Text("25 randoms"))
    }
    
    func pickRandoms() {
        var uniques = Set<HTTPStatusCode>()
        while (uniques.count < 26) {
            uniques.insert(HTTPStatusCode.allCases.randomElement()!)
        }
        randoms = Array(uniques)
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
