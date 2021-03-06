//
//  TestCoreDataStack.swift
//  RecipleaseTests
//
//  Created by Kel_Jellysh on 26/01/2022.
//

import Foundation
import CoreData
@testable import Reciplease

final class TestCoreDataStack: CoreDataStack{
   
    convenience init() {
          self.init(modelName: "Reciplease")
      }

    // MARK: -Override init
    override init(modelName: String) {
        super.init(modelName: modelName)
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        let container = NSPersistentContainer(name: modelName)
        container.persistentStoreDescriptions = [persistentStoreDescription]
        container.loadPersistentStores { storeDescription, error in
         if let error = error as NSError? {
                fatalError("Unresolved error \(String(describing: error)), \(error.userInfo)")
            }
        }
 
        self.persistentContainer = container
        
        var mainContext: NSManagedObjectContext {
                  return persistentContainer.viewContext
              }
        func saveContext() {
            do {
                try mainContext.save()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}
public extension NSManagedObject {
    convenience init(context: NSManagedObjectContext) {
        let name = String(describing: type(of: self))
        let entity = NSEntityDescription.entity(forEntityName: name, in: context)!
        self.init(entity: entity, insertInto: context)
    }
}
