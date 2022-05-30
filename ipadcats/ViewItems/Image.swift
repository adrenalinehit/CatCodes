//
//  CatImage.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct Image: View {
    
    var imageURL: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)){ image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
    }
}

struct Image_Previews: PreviewProvider {
    static var previews: some View {
        Image(imageURL: "https://dummyimage.com/200x200/000/fff")
    }
}
