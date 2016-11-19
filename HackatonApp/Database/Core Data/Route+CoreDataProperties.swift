//
//  Route+CoreDataProperties.swift
//  
//
//  Created by Каратаев Алексей on 19.11.16.
//
//

import Foundation
import CoreData


extension Route {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Route> {
        return NSFetchRequest<Route>(entityName: "Route");
    }

    @NSManaged public var name: String
    @NSManaged public var rating: Int64
    @NSManaged public var duration: Int64
    @NSManaged public var price: Int64
    @NSManaged public var cover: String
    @NSManaged public var obj_id: Int64
    @NSManaged public var descr: String
    @NSManaged public var points: Set<Node>
    @NSManaged public var gallery: Set<Gallery>
    @NSManaged public var category: Set<RouteCategory>

}

// MARK: Generated accessors for points
extension Route {

    @objc(addPointsObject:)
    @NSManaged public func addToPoints(_ value: Node)

    @objc(removePointsObject:)
    @NSManaged public func removeFromPoints(_ value: Node)

    @objc(addPoints:)
    @NSManaged public func addToPoints(_ values: Set<Route>)

    @objc(removePoints:)
    @NSManaged public func removeFromPoints(_ values: Set<Route>)

}

// MARK: Generated accessors for gallery
extension Route {

    @objc(addGalleryObject:)
    @NSManaged public func addToGallery(_ value: Gallery)

    @objc(removeGalleryObject:)
    @NSManaged public func removeFromGallery(_ value: Gallery)

    @objc(addGallery:)
    @NSManaged public func addToGallery(_ values: Set<Gallery>)

    @objc(removeGallery:)
    @NSManaged public func removeFromGallery(_ values: Set<Gallery>)

}

// MARK: Generated accessors for category
extension Route {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: RouteCategory)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: RouteCategory)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}
