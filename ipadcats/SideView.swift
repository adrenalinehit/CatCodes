//
//  SideView.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct SidebarView: View {
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink(destination: AllHttpCodes()) {
                    Label("All HTTP Status Codes", systemImage: "list.bullet.rectangle")
                }
                
                NavigationLink(destination: RandomCode()) {
                    Label("Random Status Code", systemImage: "list.bullet.rectangle")
                }
                
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Statuses")
        }
    }
}

struct RandomCode: View {
    @State var code: HTTPStatusCode = HTTPStatusCode.notFound
    
    var body: some View {
        IndividualCode(statusCode: code.rawValue)
            .onAppear {
                code = HTTPStatusCode.allCases.randomElement()!
            }
    }
}

struct AllHttpCodes: View {
    
    var codes: [HTTPStatusCode] = HTTPStatusCode.allCases
    
    var body: some View {
        List {
            ForEach(codes, id: \.self) { code in
                NavigationLink(destination: IndividualCode(statusCode:code.rawValue)) {
                    Text("HTTP Status Code: \(code.rawValue)")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

struct IndividualCode: View {
    
    var statusCode = 404
    
    var body: some View {
        VStack {
            CatImage(imageURL: "https://http.cat/\(statusCode).jpg")
        }
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
