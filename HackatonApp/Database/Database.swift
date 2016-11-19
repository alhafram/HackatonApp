//
//  Database.swift
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

import Foundation
import CoreData

@objc class Database: NSObject {
    static let instance = Database()
    
    @objc func resetDatabase() -> Void {
        self.deleteRouteEntities()
        self.deleteNodeEntities()
        self.deleteGalleryEntities()
        self.deleteRouteCategoryEntities()
    }
    
    @objc func printDatabase() -> Void {
        let routes: [Route]? = self.getEntities()
        let nodes: [Node]? = self.getEntities()
        let gallery: [Gallery]? = self.getEntities()
        let routeCategories: [RouteCategory]? = self.getEntities()
        
        if let routes = routes {
            for entity in routes {
                print("routes id: \(entity.obj_id)")
            }
        }
        
        if let nodes = nodes {
            for entity in nodes {
                print("nodes id: \(entity.obj_id)")
            }
        }
        
        if let gallery = gallery {
            for entity in gallery {
                print("gallery id: \(entity.obj_id)")
            }
        }
        
        if let routeCategories = routeCategories {
            for entity in routeCategories {
                print("routeCategories id: \(entity.obj_id)")
            }
        }
    }
    
    @objc @discardableResult func addRouteEntity(
        name: String, rating: Int64, duration: Int64,
        price: Int64, cover: String, obj_id: Int64,
        descr: String, points: Set<Node>,
        gallery: Set<Gallery>, category: Set<RouteCategory>) -> Route {
        
        let route = NSEntityDescription.insertNewObject(
            forEntityName: Route.getEntityName(),
            into: CoreDataManager.instance.managedObjectContext) as! Route
        
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
    
    @objc func deleteRouteEntities() -> Void {
        let deleteEntities: [Route]? = self.getEntities()
        if let deleteEntities = deleteEntities {
            self.deleteEntities(entities: deleteEntities)
        }
    }
    
    @objc @discardableResult func addNodeEntity(
        obj_id: Int64, name: String, time: String,
        pin: String, coordinate: String) -> Node {
        
        let node = NSEntityDescription.insertNewObject(
            forEntityName: "Node",
            into: CoreDataManager.instance.managedObjectContext) as! Node
        
        node.obj_id = obj_id
        node.coordinate = coordinate
        node.name = name
        node.time = time
        node.pin = pin
        
        CoreDataManager.saveContext()
        return node
    }
    
    @objc func deleteNodeEntities() -> Void {
        let deleteEntities: [Node]? = self.getEntities()
        if let deleteEntities = deleteEntities {
            self.deleteEntities(entities: deleteEntities)
        }
    }
    
    @objc func getRoutesId() -> [Int]? {
        let routes: [Route]? = self.getEntities()
        var listId: [Int] = []
        if let routes = routes {
            for route in routes {
                listId.append(
                    Int(route.obj_id)
                )
            }
            return listId
        }
        return nil
    }
    
    @objc @discardableResult func addGalleryEntity(
        image: String, obj_id: Int64) -> Gallery {
        
        let gallery = NSEntityDescription.insertNewObject(
            forEntityName: Gallery.getEntityName(),
            into: CoreDataManager.instance.managedObjectContext) as! Gallery
        
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
    
    @objc @discardableResult func addRouteCategoryEntity(
        obj_id: Int64, name: String) -> RouteCategory {
        
        let routeCategory = NSEntityDescription.insertNewObject(
            forEntityName: RouteCategory.getEntityName(),
            into: CoreDataManager.instance.managedObjectContext) as! RouteCategory
        
        routeCategory.obj_id = obj_id
        routeCategory.name = name
        
        CoreDataManager.saveContext()
        return routeCategory
    }
    
    @objc func deleteRouteCategoryEntities() -> Void {
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
