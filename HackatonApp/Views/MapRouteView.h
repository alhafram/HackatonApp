//
//  MapRouteView.h
//  HackatonApp
//
//  Created by Albert on 20/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface MapRouteView : UIView <GMSMapViewDelegate>

@property (strong, nonatomic) NSArray* arrayNodes;

@end
