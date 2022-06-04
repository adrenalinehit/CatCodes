//
//  GameMode.swift
//  ipadcats
//
//  Created by Nick Payne on 04/06/2022.
//

import SwiftUI

struct GameMode: View {

    @State private var address: String = ""

    var body: some View {

        Form {
            TextField("URL to test", text: $address)
                            .textFieldStyle(.roundedBorder)

            Button("Test it!") {
                testIt()
            }
        }

    }

    func testIt() {
        let url = URL(string: "https://httpbin.org/status/401")!

        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            // swiftlint:disable force_cast
            let httpResponse = response as! HTTPURLResponse
                    if httpResponse.statusCode == 402 {
                        print("woop")
                    }
        }

        task.resume()
    }
}

struct GameMode_Previews: PreviewProvider {
    static var previews: some View {
        GameMode()
    }
}
