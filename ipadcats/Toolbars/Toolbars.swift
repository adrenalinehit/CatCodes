//
//  Toolbars.swift
//  ipadcats
//
//  Created by Nick Payne on 08/10/2022.
//

import SwiftUI

struct MyToolbar: ToolbarContent {

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            NavigationLink(
                destination: Credits(),
                label: {
                    Label("Credits", systemImage: "info.bubble")
                })
        }
    }
}
