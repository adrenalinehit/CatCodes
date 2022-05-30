//
//  AllCodes.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import SwiftUI

struct AllHttpCodes: View {
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var codes: [HTTPStatusCode] = HTTPStatusCode.allCases
    
    var body: some View {
        List {
            
            ForEach(HTTPStatusCode.ResponseType.allCases) { rType in
                Text(rType.rawValue).font(.title2)
                
                ForEach(codes.filter{$0.responseType == rType}) { code in
                    NavigationLink(destination: Meme(statusCode:code.rawValue, animalType: appPrefs.animalPreference)) {
                        Text("HTTP Status Code: \(code.rawValue)")
                            .font(.body)
                            .padding()
                    }
                }
                
            }
            
            
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
