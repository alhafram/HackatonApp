//
//  ViewController.m
//  HackatonApp
//
//  Created by Albert on 19/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "ViewController.h"
#import "HackatonApp-Swift.h"
#import "HANMRoutesComponent.h"
#import "HANetworkManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    HANMRoutesComponent* r = [[HANMRoutesComponent alloc] initWithNetManager:[HANetworkManager sharedInstance]];
//    [r getAllRouteseWithCompletionBlock:^(BOOL success, NSError *error, id responseData) {
//        [[HAParseManager sharedInstance] parseRouteDictionary:responseData];
//    }];
    
    NSArray* arr = [[RouteManager instance] getRoutes];
//    NSLog(@"%@", arr);
    
    for (RouteModel* rm in arr) {
        NSLog(@"ID: %lld", rm.obj_id);
        NSLog(@"Name: %@", rm.name);
        NSLog(@"Rating: %lld", rm.rating);
        NSLog(@"Duration: %lld", rm.duration);
        NSLog(@"Price: %lld", rm.price);
        NSLog(@"Desc: %@", rm.descr);

        for (UIImage* img in rm.gallery) {
            NSLog(@"%@", img.description);
        }
        
        for (RouteCategory* rc in rm.category) {
            NSLog(@"Category name: %@", rc.name);
            NSLog(@"Category id: %lld", rc.obj_id);
        }
        
        for (Node* node in rm.points) {
            NSLog(@"Node name: %@", node.name);
            NSLog(@"Node id: %lld", node.obj_id);
            NSLog(@"Node time: %@", node.time);
            NSLog(@"Node pin: %@", node.pin);
        }
        
        NSLog(@"--------------------------");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
