//
//  MapView.m
//  HackatonApp
//
//  Created by Albert on 19/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "MapView.h"
@import GoogleMaps;

@interface CoordsList : NSObject

@property(nonatomic, readonly, copy) GMSPath *path;
@property(nonatomic, readonly) NSUInteger target;

- (id)initWithPath:(GMSPath *)path;

- (CLLocationCoordinate2D)next;

@end


@implementation CoordsList

- (id)initWithPath:(GMSPath *)path {
    if ((self = [super init])) {
        _path = [path copy];
        _target = 0;
    }
    return self;
}

- (CLLocationCoordinate2D)next {
    ++_target;
    if (_target == [_path count]) {
        _target = 0;
    }
    return [_path coordinateAtIndex:_target];
}

@end


@implementation MapView {
    GMSMapView *_mapView;
    CLLocationCoordinate2D first;
    UIView* _mapForView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _mapForView = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) / 2)];
        _mapView = [[GMSMapView alloc] initWithFrame:CGRectMake(0, 0, _mapForView.frame.size.width, _mapForView.frame.size.height)];
        
        GMSMutablePath *coords;
        GMSMarker *marker;
        
        //Markers
        GMSMarker* marker0 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(52.310683, 4.765121)];
        marker0.title = @"Netherlands";
        marker0.map = _mapView;
        marker0.icon = [UIImage imageNamed:@"black_dot"];
        marker0.snippet = @"This is snppet. This is snppet. This is snppet. This is snppet. This is snppet.";
        
        GMSMarker* marker1 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(51.471386 , -0.457148)];
        marker1.title = @"London";
        marker1.map = _mapView;
        marker1.icon = [UIImage imageNamed:@"black_dot"];
        
        GMSMarker* marker2 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(49.01378, 2.5542943)];
        marker2.title = @"Paris";
        marker2.map = _mapView;
        marker2.icon = [UIImage imageNamed:@"black_dot"];
        
        first = marker0.position;
        
        
        _mapView.camera = [GMSCameraPosition cameraWithLatitude:marker0.position.latitude longitude:marker0.position.longitude zoom:5];
        
        [_mapForView addSubview:_mapView];
        [self addSubview:_mapForView];
        
        //Path for animating
        coords = [GMSMutablePath path];
        [coords addLatitude:52.310683 longitude:4.765121];
        [coords addLatitude:51.471386 longitude:-0.457148];
        [coords addLatitude:49.01378 longitude:2.5542943];
        
        marker = [GMSMarker markerWithPosition:[coords coordinateAtIndex:0]];
        marker.icon = [UIImage imageNamed:@"dot"];
        marker.groundAnchor = CGPointMake(0.5f, 0.5f);
        marker.flat = YES;
        marker.map = _mapView;
        marker.userData = [[CoordsList alloc] initWithPath:coords];
        _mapView.settings.scrollGestures = NO;
        _mapView.settings.zoomGestures = NO;

    }
    return self;
}


@end