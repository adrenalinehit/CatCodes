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

        let ukvs = NSUbiquitousKeyValueStore.default
        ukvs.synchronize()

        if let data = ukvs.data(forKey: "Favourites") {
            print("init: \(data)")
            if let decoded = try? JSONDecoder().decode(Set<Favourite>.self, from: data) {
                codeFavourites = decoded
            }
        }

        if !codeFavourites.isEmpty {
            let fav = codeFavourites.randomElement()

            let url = fav?.animal.shareLink(statusCode: fav?.code ?? 404)
            let urlRequest = URLRequest(url: url!)

            let task = URLSession.shared.dataTask(with: urlRequest) { data, urlResponse, error in
                parseImageFromResponse(data: data, urlResponse: urlResponse, error: error, completion: completion)
            }

            task.resume()
        }
    }

    static func parseImageFromResponse(data: Data?, urlResponse: URLResponse?, error: Error?, completion: ((FavouriteResponse) -> Void)?) {

        guard error == nil, let content = data else {
            print("error getting image data")
            let response = FavouriteResponse.failure
            completion?(response)
            return
        }

        let image = UIImage(data: content)!.resized(toWidth: 800)
        let response = FavouriteResponse.success(image: image!)
        completion?(response)
    }
}

extension UIImage {
    func resized(toWidth width: CGFloat, isOpaque: Bool = true) -> UIImage? {
        let canvas = CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))
        let format = imageRendererFormat
        format.opaque = isOpaque
        return UIGraphicsImageRenderer(size: canvas, format: format).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}
