//
//  DataController.swift
//  GeoScribe
//
//  Created by Casey Barth on 3/1/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "GeoScribe")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error {
                print("CoreData failed to load \(error)")
            }
        }
    }
}
