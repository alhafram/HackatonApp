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
    
    @objc @discardableResult func addRouteEntity(
        name: String, rating: Int64, duration: Int64,
        price: Int64, cover: String, obj_id: Int64,
        descr: String, points: Set<Node>,
        gallery: Set<Gallery>, category: Set<RouteCategory>) -> Route {
        
        let route = Route()
        route.name = name
        route.rating = rating
        route.duration = duration
        route.price = price
        route.cover = cover
        route.obj_id = obj_id
        route.descr = descr
        route.points = points
        route.gallery = gallery
        route.category = category
        
        CoreDataManager.saveContext()
        return route
    }
    
    @objc func deleteRouteServiceEntities() -> Void {
        let deleteEntities: [Route]? = self.getEntities()
        if let deleteEntities = deleteEntities {
            self.deleteEntities(entities: deleteEntities)
        }
    }
    
    @objc @discardableResult func addNodeEntity(
        obj_id: Int64, name: String, time: String,
        pin: String, routes: Set<Route>) -> Node {
        
        let point = Node()
        point.obj_id = obj_id
        point.name = name
        point.time = time
        point.pin = pin
        point.routs = routes
        
        CoreDataManager.saveContext()
        return point
    }
    
    @objc func deletePointEntities() -> Void {
        let deleteEntities: [Node]? = self.getEntities()
        if let deleteEntities = deleteEntities {
            self.deleteEntities(entities: deleteEntities)
        }
    }
    
    @objc @discardableResult func addGalleryEntity(
        image: String, obj_id: Int64) -> Gallery {
        let gallery = Gallery()
        
        gallery.image = image
        gallery.obj_id = obj_id
        
        CoreDataManager.saveContext()
        return gallery
    }
    
    @objc func deleteGalleryEntities() -> Void {
        let deleteEntities: [Gallery]? = self.getEntities()
        if let deleteEntities = deleteEntities {
            self.deleteEntities(entities: deleteEntities)
        }
    }
    
    @objc @discardableResult func addCategoryEntity(
        obj_id: Int64, name: String) -> RouteCategory {
        let category = RouteCategory()
        
        category.obj_id = obj_id
        category.name = name
        
        CoreDataManager.saveContext()
        return category
    }
    
    @objc func deleteCategoryEntities() -> Void {
        let deleteEntities: [RouteCategory]? = self.getEntities()
        if let deleteEntities = deleteEntities {
            self.deleteEntities(entities: deleteEntities)
        }
    }
    
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
