//
//  CoreDataStack.swift
//  GameSafe
//
//  Created by Enayatullah Naseri on 6/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import CoreData


class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    private init() {}
    
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "GameSafe")
        
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load persistence stores: \(error)")
            }
        }
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        do {
            try mainContext.save()
        } catch {
            print("Error saving context: \(error)")
            mainContext.reset()
        }
    }
    
}
