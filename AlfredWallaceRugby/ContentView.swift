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
    @StateObject var sharedTeams = SharedTeams()
    @State private var dataFreshness = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(String(sharedTeams.data.count))
                    .task {
                        await loadRankings()
                    }
                
                Text(dataFreshness.formatted(date: .long, time:.omitted))
            }
        }
    }
    
    
    func loadRankings() async {
        guard let url = URL(string: "https://cmsapi.pulselive.com/rugby/rankings/mru") else {
            print("URL KAPUT")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .millisecondsSince1970
            
            if let decodedResponse = try? decoder.decode(WorldRugbyResponse.self, from: data) {
                dataFreshness = decodedResponse.dataFreshness
                sharedTeams.data = decodedResponse.teams
            }
        } catch {
            print("FETCH KAPUT")
            return
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
