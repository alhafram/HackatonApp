//
//  Category+CoreDataClass.swift
//  
//
//  Created by Каратаев Алексей on 19.11.16.
//
//

import Foundation
import CoreData


public class RouteCategory: NSManagedObject {
    override class func getEntityName() -> String {
        return "RouteCategory"
    }
}
