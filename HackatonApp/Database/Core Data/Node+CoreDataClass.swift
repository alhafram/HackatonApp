//
//  Point+CoreDataClass.swift
//  
//
//  Created by Каратаев Алексей on 19.11.16.
//
//

import Foundation
import CoreData


public class Node: NSManagedObject {
    override class func getEntityName() -> String {
        return "Node"
    }

}
