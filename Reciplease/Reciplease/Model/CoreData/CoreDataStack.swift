//
//  CoreDataStack.swift
//  Reciplease
//
//  Created by Kel_Jellysh on 12/01/2022.
//

import Foundation
import CoreData

final class CoreDataStack {
    //MARK: -Properties
    private let persistentContainerName = "Reciplease"
    
    //MARK: -Singleton
    static let sharedInstance = CoreDataStack()
    
    //MARK: -Public
    var viewContext: NSManagedObjectContext {
        return CoreDataStack.sharedInstance.persistentContainer.viewContext
    }
    //MARK: -Private
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        container.loadPersistentStores( completionHandler: { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo) for : \(storeDescription.description)")
            }
        })
        return container
    }()
}
