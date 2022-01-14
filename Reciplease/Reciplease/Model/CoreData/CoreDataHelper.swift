//
//  CoreDataHelper.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 14/01/2022.
//

import Foundation
import CoreData

final class CoreDataHelper {
    
    // MARK: - Singleton
    
    static let shared: CoreDataHelper = CoreDataHelper()
    
    // MARK: - Properties
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Reciplease")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            guard let unwrappedError = error else { return }
            
            fatalError("Unresolved error \(unwrappedError.localizedDescription)")
        })
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core
        
    func getObject<T: NSManagedObject>(predicate: NSPredicate? = nil) -> [T]? {
        
        let request: NSFetchRequest<T> = NSFetchRequest(entityName: String(describing: T.self))
        request.predicate = predicate
        
        guard let results = try? viewContext.fetch(request) else { return nil }
        
        return results
    }
}
