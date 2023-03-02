//
//  GeoScribeApp.swift
//  GeoScribe
//
//  Created by Casey Barth on 2/27/23.
//

import SwiftUI

@main
struct GeoScribeApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
