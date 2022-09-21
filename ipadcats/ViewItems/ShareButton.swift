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
        Button {
            shareSheet()
        } label: {
            Label("Share", systemImage: "square.and.arrow.up")
        }
    }

    // todo: ugly, needs refactoring
    func shareSheet() {
        let shareText = "I've just laughed at this Http Status code meme! Check it out!"

        switch animalType {
        case .cat:
            guard let urlShare = URL(string: "https://http.cat/\(statusCode).jpg") else { return }
            let activityVC = UIActivityViewController(activityItems: [shareText, urlShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        case .dog:
            guard let urlShare = URL(string: "https://http.dog/\(statusCode).jpg") else { return }
            let activityVC = UIActivityViewController(activityItems: [shareText, urlShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        case .garden:
            guard let urlShare = URL(string: "https://http.garden/\(statusCode).jpg") else { return }
            let activityVC = UIActivityViewController(activityItems: [shareText, urlShare], applicationActivities: nil)
            UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton()
    }
}
