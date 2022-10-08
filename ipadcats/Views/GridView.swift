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
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(randoms.sorted(by: { return $0.rawValue < $1.rawValue })) { code in
                        NavigationLink(destination: Meme(appPrefs: _appPrefs, statusCode: code.rawValue, animalType: appPrefs.animalPreference)) {
                            ZStack(alignment: .bottomTrailing) {
                                RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.black)
                                MyImage(animalType: appPrefs.animalPreference, statusCode: code.rawValue).frame(height: 200)
                                FavouriteButton(appPrefs: _appPrefs, statusCode: code.rawValue, animalType: appPrefs.animalPreference, textLabel: false).backgroundStyle(.black).padding(.all)
                            }.padding(2)
                        }
                    }
                }
            }
            .accessibilityLabel("gridScroll")
            .onAppear {
                pickRandoms()
            }
            .navigationBarTitle(Text("25 randoms"))
        }
    }

    func pickRandoms() {
        var uniques = Set<HTTPStatusCode>()
        while uniques.count < 25 {
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
