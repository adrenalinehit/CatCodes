//
//  CatImage.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//
import NukeUI
import SwiftUI

struct MyImage: View {

    var animalType: AnimalType = .cat
    var statusCode: Int = 404

    var body: some View {
        LazyImage(url: URL(string: imageURL())) { state in
            if let image = state.image {
                image.resizingMode(.aspectFit)
            } else if state.error != nil {
                Color.red
            } else {
                GeometryReader { geometry in
                    ProgressView().frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
        }
    }

    func imageURL() -> String {
        switch animalType {
        case .cat:
            return "https://httpcats.com/\(statusCode).jpg"
        case .dog:
            return "https://http.dog/\(statusCode).jpg"
        case .garden:
            return "https://http.garden/\(statusCode).jpg"
        }
    }
}

struct MyImage_Previews: PreviewProvider {
    static var previews: some View {
        MyImage()
    }
}
