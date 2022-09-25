//
//  ShareButton.swift
//  ipadcats
//
//  Created by Nick Payne on 23/06/2022.
//

import SwiftUI

struct ShareButton: View {

    var statusCode = 404
    var animalType = AnimalType.cat

    var body: some View {
        let link = shareLink()

        VStack {
            ShareLink(
                item: link,
                message: Text("I've just laughed at this Http Status code meme! Check it out!")
            )
        }
    }

    func shareLink() -> URL {
        var urlShare: URL

        switch animalType {
        case .cat:
            urlShare = URL(string: "https://httpcats.com/\(statusCode).jpg")!
        case .dog:
            urlShare = URL(string: "https://http.dog/\(statusCode).jpg")!
        case .garden:
            urlShare = URL(string: "https://http.garden/\(statusCode).jpg")!
        }

        return urlShare
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
