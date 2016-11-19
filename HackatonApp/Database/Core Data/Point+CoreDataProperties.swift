//
//  Point+CoreDataProperties.swift
//  
//
//  Created by Каратаев Алексей on 19.11.16.
//
//

import Foundation
import CoreData

extension Point {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Point> {
        return NSFetchRequest<Point>(entityName: "Point");
    }

    @NSManaged public var obj_id: Int64
    @NSManaged public var name: String
    @NSManaged public var time: String
    @NSManaged public var pin: String
    @NSManaged public var routs: Set<Route>

}

// MARK: Generated accessors for routs
extension Point {

    @objc(addRoutsObject:)
    @NSManaged public func addToRouts(_ value: Route)

    @objc(removeRoutsObject:)
    @NSManaged public func removeFromRouts(_ value: Route)

    @objc(addRouts:)
    @NSManaged public func addToRouts(_ values: NSSet)

    @objc(removeRouts:)
    @NSManaged public func removeFromRouts(_ values: NSSet)

}
