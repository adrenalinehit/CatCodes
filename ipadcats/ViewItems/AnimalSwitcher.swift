//
//  AnimalSwitcher.swift
//  ipadcats
//
//  Created by Nick Payne on 23/06/2022.
//

import SwiftUI

struct AnimalSwitcher: View {

    @EnvironmentObject var appPrefs: AppPreferences

    var body: some View {
        Picker("Animal Type", selection: $appPrefs.animalPreference) {
            Text("Cats").tag(AnimalType.cat)
            Text("Dogs").tag(AnimalType.dog)
        }.pickerStyle(.segmented)
    }
}

struct AnimalSwitcher_Previews: PreviewProvider {
    static var previews: some View {
        AnimalSwitcher().environmentObject({ () -> AppPreferences in
            let envObj = AppPreferences()
            envObj.animalPreference = .cat
            return envObj
        }() )
    }
}
