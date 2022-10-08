//
//  AllCodes.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import SwiftUI
import ipadcats_data

struct AllHttpCodes: View {

    @EnvironmentObject var appPrefs: AppPreferences

    @State private var searchText = ""

    var codes: [HTTPStatusCode] = HTTPStatusCode.allCases

    var body: some View {
        NavigationStack {
            List {
                ForEach(HTTPStatusCode.ResponseType.allCases) { rType in

                    Section(header: Text(rType.rawValue).font(.title2)) {

                        ForEach(searchResults.filter {$0.responseType == rType}) { code in
                            NavigationLink(destination: Meme(statusCode: code.rawValue, animalType: appPrefs.animalPreference)) {
                                Text("HTTP Status Code: \(code.rawValue)")
                                    .font(.body)
                            }
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .searchable(text: $searchText)
            .navigationBarTitle(Text("All statuses"))
        }
    }

    var searchResults: [HTTPStatusCode] {
        let all: [HTTPStatusCode] = HTTPStatusCode.allCases

        if searchText.isEmpty {
            return all
        } else {
            return all.filter { $0.rawValue == Int(searchText) || $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct AllCodes_Previews: PreviewProvider {
    static var previews: some View {
        AllHttpCodes().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
