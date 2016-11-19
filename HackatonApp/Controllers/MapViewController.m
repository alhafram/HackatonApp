//
//  MapViewController.m
//  GoogleMapsTest
//
//  Created by Albert on 19/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "MapViewController.h"
@import GoogleMaps;
#import "CustomSnippetView.h"

#import "HANMRoutesComponent.h"
#import "HANetworkManager.h"
#import "HAParseManager.h"

#import "HackatonApp-Swift.h"

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


@implementation MapViewController {
    
    GMSMapView *_mapView;
    GMSMarker *_fadedMarker;
    CLLocationCoordinate2D first;
    UIView* _mapForView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
    _mapForView = [[UIView alloc]  initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) / 2)];
    _mapView = [[GMSMapView alloc] initWithFrame:CGRectMake(0, 0, _mapForView.frame.size.width, _mapForView.frame.size.height)];
    
    GMSMutablePath *coords;
    GMSMarker *marker;
    
    //Markers
    GMSMarker* marker0 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(52.310683, 4.765121)];
    marker0.title = @"Netherlands";
    marker0.map = _mapView;
    marker0.icon = [UIImage imageNamed:@"city"];
    marker0.snippet = @"The Netherlands is the main constituent country of the Kingdom of the Netherlands.";
    
    GMSMarker* marker1 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(51.471386 , -0.457148)];
    marker1.title = @"London";
    marker1.map = _mapView;
    marker1.icon = [UIImage imageNamed:@"city"];
    marker1.snippet = @"London is the capital and most populous city of England and the United Kingdom.";
    
    GMSMarker* marker2 = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(49.01378, 2.5542943)];
    marker2.title = @"Paris";
    marker2.map = _mapView;
    marker2.icon = [UIImage imageNamed:@"city"];
    marker2.snippet = @"Paris is the capital and the most populous city of France.";
    
    first = marker0.position;
    
    
    _mapView.camera = [GMSCameraPosition cameraWithLatitude:marker0.position.latitude longitude:marker0.position.longitude zoom:5];
    _mapView.settings.zoomGestures = NO;
    _mapView.settings.scrollGestures = NO;
    
    [_mapForView addSubview:_mapView];
    [self.view addSubview:_mapForView];
    
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
    [self animateToNextCoord:marker];
    _mapView.delegate = self;
}


- (void)animateToNextCoord:(GMSMarker *)marker {
    CoordsList *coords = marker.userData;
    CLLocationCoordinate2D coord = [coords next];
    CLLocationCoordinate2D previous = marker.position;
    
    CLLocationDistance distance = GMSGeometryDistance(previous, coord);
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:(distance / (100 * 1000))];  // custom duration, 50km/sec
    
    __weak MapViewController *weakSelf = self;
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
    
    CustomSnippetView* view = [[[NSBundle mainBundle] loadNibNamed:@"CustomSnippetView" owner:self.view options:nil] objectAtIndex:0];
    ///view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, 100);
    view.title.text = marker.title;
    view.snippet.text = marker.snippet;
    view.layer.cornerRadius = 13.f;
    
    return view;
}


@end
