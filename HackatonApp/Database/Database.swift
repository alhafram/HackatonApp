//
//  Database.swift
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

import Foundation
import CoreData

class Database {
    static let instance = Database()
    
    
    func getEntities<T: NSManagedObject>() -> [T]? {
        let request: NSFetchRequest<T> = NSFetchRequest(
            entityName: T.getEntityName())
        do {
            let entities = try CoreDataManager.instance
                .managedObjectContext.fetch(request)
            return entities
        } catch (let error as NSError) {
            print(error.description)
        }
        return nil
    }
    
    func getEntities<T: NSManagedObject>(
        predicate: NSPredicate) -> [T]? {
        let request: NSFetchRequest<T> = NSFetchRequest(
            entityName: T.getEntityName())
        request.predicate = predicate
        do {
            let entities = try CoreDataManager.instance
                .managedObjectContext.fetch(request)
            return entities
        } catch (let error as NSError) {
            print(error.description)
        }
        return nil
    }
    
    func deleteEntities<T: NSManagedObject>(entities: [T]) {
        for entity in entities {
            CoreDataManager.instance.managedObjectContext.delete(entity)
        }
    }
}
