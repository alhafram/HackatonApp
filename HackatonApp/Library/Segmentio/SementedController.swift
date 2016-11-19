//
//  SementedController.swift
//  HackatonApp
//
//  Created by Каратаев Алексей on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

import Foundation
import Segmentio

class CBSegmentedControl {
    let segmentioView: Segmentio!
    
    var indicatorOptions: SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 0.85,
            height: 2,
            color: UIColor.white
        )
    }
    
    var horizontalSeparatorOptions: SegmentioHorizontalSeparatorOptions {
        return SegmentioHorizontalSeparatorOptions(
            type: SegmentioHorizontalSeparatorType.bottom,
            height: 1,
            color: UIColor.clear
        )
    }
    
    var verticalSeparatorOptions: SegmentioVerticalSeparatorOptions {
        return  SegmentioVerticalSeparatorOptions(
            ratio: 0.5,
            color: UIColor.clear
        )
    }
    
    var states: SegmentioStates {
        return SegmentioStates(
            defaultState: SegmentioState(
                backgroundColor: UIColor.clear,
                titleFont: UIFont.systemFont(ofSize: 13),
                titleTextColor: UIColor.white
            ),
            selectedState: SegmentioState(
                backgroundColor: UIColor.clear,
                titleFont: UIFont.boldSystemFont(ofSize: 13),
                titleTextColor: UIColor.white
            ),
            highlightedState: SegmentioState(
                backgroundColor: UIColor.clear,
                titleFont: UIFont.boldSystemFont(ofSize: 13),
                titleTextColor: UIColor.white
            )
        )
    }
    
    var options: SegmentioOptions {
        return SegmentioOptions(
            backgroundColor: UIColor.red,
            maxVisibleItems: 3,
            scrollEnabled: false,
            indicatorOptions: self.indicatorOptions,
            horizontalSeparatorOptions:
            self.horizontalSeparatorOptions,
            verticalSeparatorOptions:
            self.verticalSeparatorOptions,
            imageContentMode: .center,
            labelTextAlignment: .center,
            segmentStates: self.states
        )
    }
    
    var index: Int {
        get {
            return self
                .segmentioView
                .selectedSegmentioIndex
        } set {
            self
                .segmentioView
                .selectedSegmentioIndex = newValue
        }
    }
    
    init(items: [SegmentioItem], view: UIView, handler: @escaping SegmentioSelectionCallback) {
        
        self.segmentioView = Segmentio(frame: CGRect(
            x: 0,
            y: 0,
            width: view.bounds.width,
            height: 40
        ))
        
        self.segmentioView.setup(
            content: items,
            style: .onlyLabel,
            options: self.options
        )
        
        self.segmentioView.valueDidChange = handler
        view.addSubview(segmentioView)
    }
}
