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
                
                NavigationLink(destination: MyFavourites()) {
                    Label("My Favourites", systemImage: "list.bullet.rectangle")
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
            
            //RandomCode()
        }
        
    }
}

struct MyFavourites: View {
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var body: some View {
        List {
            ForEach(appPrefs.codeFavourites.sorted(by: >), id: \.self) { fav in
                IndividualCode(statusCode: fav.code, animalType: fav.animal)
            }
        }
    }
    
}

struct RandomCode: View {
    
    @State private var code: HTTPStatusCode = HTTPStatusCode.notFound
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var body: some View {
        
        VStack {
            IndividualCode(statusCode: code.rawValue, animalType: appPrefs.animalPreference)
                .onAppear {
                    code = HTTPStatusCode.allCases.randomElement()!
                }
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
    
    @EnvironmentObject var appPrefs: AppPreferences
    
    var codes: [HTTPStatusCode] = HTTPStatusCode.allCases
    
    var body: some View {
        List {
            ForEach(codes) { code in
                NavigationLink(destination: IndividualCode(statusCode:code.rawValue, animalType: appPrefs.animalPreference)) {
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
    var animalType = AnimalType.cat
    
    var body: some View {
        VStack {
            switch animalType {
            case .cat:
                Image(imageURL: "https://http.cat/\(statusCode).jpg")
            case .dog:
                Image(imageURL: "https://http.dog/\(statusCode).jpg")
            }
            
        }
        
        Button {
            favouriteItem()
        } label: {
            appPrefs.isFavourite(animal: animalType, code: statusCode) ? Label("Favourite", systemImage: "star.fill") : Label("Favourite", systemImage: "star")
        }
        
    }
    
    func favouriteItem(){
        appPrefs.favourite(animal: animalType, code: statusCode)
    }
}

struct SideView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
