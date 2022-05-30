//
//  RandomCode.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import SwiftUI

struct RandomCode: View {
    
    @State private var code: HTTPStatusCode = HTTPStatusCode.notFound
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var body: some View {
        
        VStack {
            Meme(statusCode: code.rawValue, animalType: appPrefs.animalPreference)
                .onAppear {
                    code = HTTPStatusCode.allCases.randomElement()!
                }
        }
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Spacer()
                Button {
                    newRandom()
                } label: {
                    Label("Another...", systemImage: "chevron.right.2")
                }
                
            }
        }
    }
    
    func newRandom() {
        code = HTTPStatusCode.allCases.randomElement()!
    }
}

struct RandomCode_Previews: PreviewProvider {
    static var previews: some View {
        RandomCode().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
