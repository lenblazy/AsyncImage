//
//  ContentView.swift
//  AsyncImage
//
//  Created by Lennox Mwabonje on 23/05/2023.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
    
}

struct ContentView: View {
    
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        
//        AsyncImage(url: URL(string: imageURL)){ image in
//            image
//                .imageModifier()
//
//        } placeholder: {
//            Image(systemName: "photo.circle.fill")
//                .iconModifier()
//        }
//        .padding(40)
        
        //MARK: - 4. PHASE
        AsyncImage(url: URL(string: imageURL)){ phase in
            
            if let image = phase.image{
                image.imageModifier()
            }else if phase.error != nil{
                Image(systemName: "ant.circle.fill")
                              .iconModifier()
            }else{
                Image(systemName: "photo.circle.fill")
                              .iconModifier()
            }
        }
        .padding(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
