//
//  ShareButton.swift
//  ipadcats
//
//  Created by Nick Payne on 23/06/2022.
//

import SwiftUI
import FirebaseAnalytics

struct ShareButton: View {

    var statusCode = 404
    var animalType = AnimalType.cat

    var body: some View {
        let link = animalType.shareLink(statusCode: statusCode)

        VStack {
            ShareLink(
                item: link,
                message: Text("I've just laughed at this Http Status code meme! Check it out!")
            ).onSubmit {
                AppLog.share(code: String(statusCode), meme: animalType.rawValue)
            }
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
