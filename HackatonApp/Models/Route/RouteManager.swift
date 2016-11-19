//
//  RouteManager.swift
//  HackatonApp
//
//  Created by Каратаев Алексей on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

import Foundation

@objc class RouteManager: NSObject {
    static let instance = RouteManager()
    
    @objc func getRoutes() -> [RouteModel]? {
        let routes: [Route]? = Database.instance.getEntities()
        var models: [RouteModel] = [RouteModel]()
        if let routes = routes {
            for route in routes {
                models.append(
                    RouteModel(
                        id: route.obj_id,
                        name: route.name,
                        description: route.descr,
                        cover: route.cover,
                        points: route.points,
                        rating: route.rating,
                        duration: route.duration,
                        price: route.price,
                        gallery: route.gallery,
                        category: route.category
                    )
                )
            }
            return models
        }
        return nil
    }
}
