//
//  SideView.swift
//  ipadcats
//
//  Created by Nick Payne on 26/05/2022.
//

import SwiftUI

struct SidebarView: View {
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var body: some View {
        NavigationView {
            List {
                
                NavigationLink(destination: AllHttpCodes()) {
                    Label("All HTTP Status Codes", systemImage: "list.bullet.rectangle")
                }
                
                NavigationLink(destination: RandomCode()) {
                    Label("Random Status Code", systemImage: "shuffle")
                }
                
                Picker(selection: $appPrefs.animalPreference, label:Text("Animal Type:")) {
                    Text("Cats").tag(AnimalType.cat)
                    Text("Dogs").tag(AnimalType.dog)
                }
                
            }
            
            .listStyle(SidebarListStyle())
            .navigationTitle("Statuses")
            RandomCode()
        }
        
    }
}

struct RandomCode: View {
    @State private var code: HTTPStatusCode = HTTPStatusCode.notFound
    
    var body: some View {
        
        IndividualCode(statusCode: code.rawValue)
            .onAppear {
                code = HTTPStatusCode.allCases.randomElement()!
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Spacer()
                    Button {
                        newRandom()
                    } label: {
                        Label("Another...", systemImage: "chevron.right.2")
                    }
                    
                }
            }
        
    }
    
    func newRandom() {
        code = HTTPStatusCode.allCases.randomElement()!
    }
}

struct AllHttpCodes: View {
    
    var codes: [HTTPStatusCode] = HTTPStatusCode.allCases
    
    var body: some View {
        List {
            ForEach(codes) { code in
                NavigationLink(destination: IndividualCode(statusCode:code.rawValue)) {
                    Text("HTTP Status Code: \(code.rawValue)")
                        .font(.title3)
                        .padding()
                }
            }
        }
    }
}

struct IndividualCode: View {
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var statusCode = 404
    
    var body: some View {
        VStack {
            switch appPrefs.animalPreference {
            case .cat:
                Image(imageURL: "https://http.cat/\(statusCode).jpg")
            case .dog:
                Image(imageURL: "https://http.dog/\(statusCode).jpg")
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Spacer()
                Button {
                    favouriteItem()
                } label: {
                    Label("Favourite", systemImage: "star")
                }
            }
        }
    }
    
    func favouriteItem(){
        print("favoriting...")
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
