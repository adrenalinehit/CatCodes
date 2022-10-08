//
//  RandomCode.swift
//  ipadcats
//
//  Created by Nick Payne on 30/05/2022.
//

import SwiftUI
import ipadcats_data

struct RandomCode: View {
    @State private var code: HTTPStatusCode = HTTPStatusCode.notFound
    @State var randoms: [HTTPStatusCode] = []

    @EnvironmentObject var appPrefs: AppPreferences

    var body: some View {
        NavigationStack {
            VStack {
                Meme(statusCode: code.rawValue, animalType: appPrefs.animalPreference)
                    .onAppear {
                        newRandom()
                    }
            }
            .navigationBarTitle(Text("HTTP \(code.rawValue)"))
            .toolbar {
                MyToolbar()
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        goBack()
                    } label: {
                        Label("Previous...", systemImage: "chevron.left.2")
                    }.hiddenConditionally(isHidden: randoms.count <= 1)

                    Spacer()

                    Button {
                        newRandom()
                    } label: {
                        Label("Another...", systemImage: "chevron.right.2")
                    }
                }
            }
        }
    }

    func newRandom() {
        code = HTTPStatusCode.allCases.randomElement()!
        randoms.append(code)
    }

    func goBack() {
        randoms = randoms.dropLast()
        let item = randoms.last
        code = randoms.popLast()!
        randoms.append(item!)
    }
}

extension View {
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
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
