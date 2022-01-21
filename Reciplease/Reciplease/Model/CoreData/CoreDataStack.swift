//
//  CoreDataHelper.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/01/2022.
//

import Foundation
import CoreData

final class CoreDataStack {
    
    // MARK: - Singleton
    static let shared: CoreDataStack = CoreDataStack()
    
    // MARK: - Properties
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Reciplease")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            guard let unwrappedError = error else { return }
            
            fatalError("Unresolved error \(unwrappedError.localizedDescription)")
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
//MARK: Method to save
    func saveContext() {
        do {
            try mainContext.save()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
    
