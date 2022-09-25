//
//  FavoriteImageProvider.swift
//  widgetsExtension
//
//  Created by Nick Payne on 01/06/2022.
//

import Foundation
import UIKit

enum FavouriteResponse {
    case success(image: UIImage)
    case failure
}

class FavouriteImageProvider {

    static func randomFavouriteImage(completion: ((FavouriteResponse) -> Void)?) {

        var codeFavourites: Set<Favourite> = []

        if let data = UserDefaults(suiteName: "group.uk.co.enyapkcin.ipadcats")!.data(forKey: "Favourites") {
            if let decoded = try? JSONDecoder().decode(Set<Favourite>.self, from: data) {
                codeFavourites = decoded
            }
        }

        var urlString = ""
        let fav = codeFavourites.randomElement()

        switch fav?.animal {
        case .cat:
            urlString="https://httpcats.com/\(fav?.code ?? 404).jpg"
        case .dog:
            urlString="https://http.dog/\(fav?.code ?? 404).jpg"
        case .garden:
            urlString="https://http.garden/\(fav?.code ?? 404).jpg"
        case .none:
            urlString="https://httpcats.com/404.jpg"
        }

        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
            parseImageFromResponse(data: data, urlResponse: urlResponse, error: error, completion: completion)
        }

        task.resume()
    }

    static func parseImageFromResponse(data: Data?, urlResponse: URLResponse?, error: Error?, completion: ((FavouriteResponse) -> Void)?) {

        guard error == nil, let content = data else {
            print("error getting image data")
            let response = FavouriteResponse.failure
            completion?(response)
            return
        }

        let image = UIImage(data: content)!
        let response = FavouriteResponse.success(image: image)
        completion?(response)
    }
}
