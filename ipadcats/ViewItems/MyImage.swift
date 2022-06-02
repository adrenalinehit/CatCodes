//
//  CatImage.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct MyImage: View {

    var imageURL: String

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct MyImage_Previews: PreviewProvider {
    static var previews: some View {
        MyImage(imageURL: "https://dummyimage.com/200x200/000/fff")
    }
}
