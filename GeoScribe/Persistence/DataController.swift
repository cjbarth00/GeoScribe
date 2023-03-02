//
//  DataController.swift
//  GeoScribe
//
//  Created by Casey Barth on 3/1/23.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    private struct Constants {
        static var containerName = "GeoScribe"
        static var devPath = "/dev/null"
    }
    
    var container: NSPersistentContainer
    var context: NSManagedObjectContext {
        return container.viewContext
    }
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: Constants.containerName)
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: Constants.devPath)
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Error loading core data\nError: \(error)")
            }
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context \(error)")
            }
        }
    }
}
