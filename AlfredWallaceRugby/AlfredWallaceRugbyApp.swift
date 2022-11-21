//
//  AlfredWallaceRugbyApp.swift
//  AlfredWallaceRugby
//
//  Created by Arthur Falque Pierrotin on 06/11/2022.
//

import SwiftUI

@main
struct AlfredWallaceRugbyApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
