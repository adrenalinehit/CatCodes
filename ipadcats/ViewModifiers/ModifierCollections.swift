//
//  ModifierCollections.swift
//  ipadcats
//
//  Created by Nick Payne on 26/09/2022.
//

import SwiftUI

struct MyCreditsLink: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Capsule().stroke(lineWidth: 2))
    }
}

extension View {
    func myCreditsLink() -> some View {
        modifier(MyCreditsLink())
    }
}
