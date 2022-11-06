//
//  ContentView.swift
//  AlfredWallaceRugby
//
//  Created by Arthur Falque Pierrotin on 06/11/2022.
//
// https://cmsapi.pulselive.com/rugby/rankings/mru
//
// todo 1 : récupérer les data + cas d'erreurs
// todo 2 : faire un fichier class+struct pour decoder le JSON en Swift data
// todo 3 : faire une list dans la vue principale
// todo 4 : faire un bouton + sheet pour ajouter un match
// todo 5 : que l'on puisse aller et venir entre l'état de départ et l'état post-match



import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
