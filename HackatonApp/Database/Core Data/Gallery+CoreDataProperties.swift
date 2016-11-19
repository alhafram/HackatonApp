//
//  Gallery+CoreDataProperties.swift
//  
//
//  Created by Каратаев Алексей on 19.11.16.
//
//

import Foundation
import CoreData 

extension Gallery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Gallery> {
        return NSFetchRequest<Gallery>(entityName: "Gallery");
    }

    @NSManaged public var image: String
    @NSManaged public var obj_id: Int64
    @NSManaged public var routs: Set<Route>?

}

// MARK: Generated accessors for routs
extension Gallery {

    @objc(addRoutsObject:)
    @NSManaged public func addToRouts(_ value: Route)

    @objc(removeRoutsObject:)
    @NSManaged public func removeFromRouts(_ value: Route)

    @objc(addRouts:)
    @NSManaged public func addToRouts(_ values: NSSet)

    @objc(removeRouts:)
    @NSManaged public func removeFromRouts(_ values: NSSet)

}
