//
//  MapRouteView.m
//  HackatonApp
//
//  Created by Albert on 20/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "MapRouteView.h"
#import "CustomSnippetView.h"

#import "HAParseManager.h"
#import "HASaveManager.h"
#import "HackatonApp-Swift.h"

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



@implementation MapRouteView {
    GMSMapView *_mapView;
    CLLocationCoordinate2D first;
    UIView* _mapForView;
    GMSMarker* me;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        _mapForView = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) / 2)];
        _mapView = [[GMSMapView alloc] initWithFrame:CGRectMake(0, 0, _mapForView.frame.size.width, _mapForView.frame.size.height)];
        
        
        GMSMutablePath *coords;
        
        for (Node* node in self.points) {
            
            NSArray* components = [node.coordinate componentsSeparatedByString:@","];
            GMSMarker* marker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake([[components objectAtIndex:0] floatValue], [[components objectAtIndex:1] floatValue])];
            marker.title = node.name;
            marker.map = _mapView;
            marker.icon = [UIImage imageNamed:@"city"]; //node.pin;
            marker.snippet = [NSString stringWithFormat:@"%@, %@", node.name, node.time];
            
            if([node isEqual:self.points.firstObject]) {
                first = marker.position;
            }
        }
        
        _mapView.camera = [GMSCameraPosition cameraWithLatitude:first.latitude longitude:first.longitude zoom:5];
        _mapView.settings.zoomGestures = NO;
        _mapView.settings.scrollGestures = NO;
        
        [_mapForView addSubview:_mapView];
        [self addSubview:_mapForView];
        
        
        coords = [GMSMutablePath path];
        for(Node* node in self.points) {
            
            NSArray* components = [node.coordinate componentsSeparatedByString:@","];
            [coords addLatitude:[[components objectAtIndex:0] floatValue] longitude:[[components objectAtIndex:1] floatValue]];
        }
        
        me = [GMSMarker markerWithPosition:[coords coordinateAtIndex:0]];
        me.icon = [UIImage imageNamed:@"dot"];
        me.flat = YES;
        me.map = _mapView;
        me.userData = [[CoordsList alloc] initWithPath:coords];
        [self animateToNextCoord:me];
        _mapView.delegate = self;
    }
    return self;
}


- (void)animateToNextCoord:(GMSMarker *)marker {
    CoordsList *coords = me.userData;
    CLLocationCoordinate2D coord = [coords next];
    CLLocationCoordinate2D previous = marker.position;
    
    CLLocationDistance distance = GMSGeometryDistance(previous, coord);
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:(distance / (100 * 1000))];  // custom duration, 50km/sec
    
    __weak MapRouteView *weakSelf = self;
    [CATransaction setCompletionBlock:^{
        
        if(first.latitude != coord.latitude && first.longitude != coord.longitude) {
            [weakSelf animateToNextCoord:marker];
            [CATransaction commit];
        }
    }];
    
    marker.position = coord;
}

#pragma mark - GMSMapViewDelegate

- (UIView *GMS_NULLABLE_PTR)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    
    if(![me isEqual:marker]) {
        
        CustomSnippetView* view = [[[NSBundle mainBundle] loadNibNamed:@"CustomSnippetView" owner:self options:nil] objectAtIndex:0];
        view.title.text = marker.title;
        view.snippet.text = marker.snippet;
        view.layer.cornerRadius = 13.f;
        return view;
    }
    
    return nil;
}

@end
