//
//  Category+CoreDataProperties.swift
//  
//
//  Created by Каратаев Алексей on 19.11.16.
//
//

import Foundation
import CoreData


extension RouteCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RouteCategory> {
        return NSFetchRequest<RouteCategory>(entityName: "RouteCategory");
    }

    @NSManaged public var name: String
    @NSManaged public var obj_id: Int64
    @NSManaged public var routs: Set<Route>?

}

// MARK: Generated accessors for routs
extension RouteCategory {

    @objc(addRoutsObject:)
    @NSManaged public func addToRouts(_ value: RouteCategory)

    @objc(removeRoutsObject:)
    @NSManaged public func removeFromRouts(_ value: RouteCategory)

    @objc(addRouts:)
    @NSManaged public func addToRouts(_ values: NSSet)

    @objc(removeRouts:)
    @NSManaged public func removeFromRouts(_ values: NSSet)

}
