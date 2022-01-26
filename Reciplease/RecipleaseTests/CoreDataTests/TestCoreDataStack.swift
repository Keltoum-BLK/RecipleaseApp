//
//  TestCoreDataStack.swift
//  RecipleaseTests
//
//  Created by Kel_Jellysh on 26/01/2022.
//

import Foundation
import CoreData
@testable import Reciplease

class TestCoreDataStack: CoreDataStack{
    
    // MARK: -Override init
    override init() {
        super.init()
        lazy var persistentContainer: NSPersistentContainer = {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            let container = NSPersistentContainer(name: "Reciplease")
            container.loadPersistentStores(completionHandler: { (description, error) in
                
                guard let unwrappedError = error else { return }
                
                fatalError("Unresolved error \(unwrappedError.localizedDescription)")
            })
            return container
        }()
        
        var mainContext: NSManagedObjectContext {
            return persistentContainer.viewContext
        }
    }

    
}
