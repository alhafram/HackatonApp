//
//  Extansions.swift
//  HackatonApp
//
//  Created by Каратаев Алексей on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    class func getEntityName() -> String {
        return String()
    }
}

extension UINavigationBar {
    func setBottomBorderColor(color: UIColor, height: CGFloat) {
        let bottomBorderRect = CGRect(x: 0, y: frame.height, width: frame.width, height: height)
        let bottomBorderView = UIView(frame: bottomBorderRect)
        bottomBorderView.backgroundColor = color
        bottomBorderView.alpha = 0
        
        addSubview(bottomBorderView)
    }
}
