//
//  AppDelegate.m
//  HackatonApp
//
//  Created by Albert on 19/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "AppDelegate.h"
#import "HANMRoutesComponent.h"
#import "HANetworkManager.h"
#import "HackatonApp-Swift.h"
#import "HAParseManager.h"
@import GoogleMaps;


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
//    }];
//    
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [GMSServices provideAPIKey:@"AIzaSyAHKH9Yai6XPfUx692OsN8XJOJ8Qavbcdw"];

    [self loadData];
    
    return YES;
}

- (void)loadData {
    HANMRoutesComponent* r = [[HANMRoutesComponent alloc] initWithNetManager:[HANetworkManager sharedInstance]];
    [r getAllRouteseWithCompletionBlock:^(BOOL success, NSError *error, id responseData) {
        [[HAParseManager sharedInstance] parseRouteDictionary:responseData];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATE_UI" object:nil];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
}

@end
