//
//  Route.swift
//  HackatonApp
//
//  Created by Каратаев Алексей on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

import Foundation
import UIKit

class RouteModel {
    
    let name: String
    let rating: Int64
    let duration: Int64
    let price: Int64
    let cover: UIImage
    let obj_id: Int64
    let descr: String
    let points: Set<Node>
    var gallery: [UIImage]
    let category: Set<RouteCategory>
    
    init(
        id: Int64, name: String, description: String,
        cover: String, points: Set<Node>,
        rating: Int64, duration: Int64, price: Int64,
        gallery: Set<Gallery>, category: Set<RouteCategory>) {
        
        self.name = name
        self.cover = HASaveManager().getImageByName(cover)
        self.obj_id = id
        self.descr = description
        self.rating = rating
        self.duration = duration
        self.price = price
        self.points = points
        self.category = category
        self.gallery = []
        for item in gallery {
            self.gallery.append(
                HASaveManager().getImageByName(item.image)
            )
        }
    }
}
