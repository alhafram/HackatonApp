//
//  HAParseManager.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HAParseManager.h"
#import "HackatonApp-Swift.h"

@implementation HAParseManager

+ (HAParseManager *)sharedInstance {
    static HAParseManager* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HAParseManager alloc] init];
    });
    return sharedInstance;
}

- (void)parseRouteDictionary:(NSDictionary *)responseData {
    
    NSArray* pointsArray = responseData[@"points"];
    NSArray* routesArray = responseData[@"routes"];
    
    for (NSDictionary* dict in routesArray) {
        [[Database instance] addRouteEntityWithName:dict[@"name"]
                                             rating:(int64_t)dict[@"rating"]
                                           duration:(int64_t)dict[@"duration"]
                                              price:(int64_t)dict[@"price"]
                                              cover:dict[@"cover"]
                                             obj_id:(int64_t)dict[@"id"]
                                              descr:dict[@"description"]
                                             points:dict[@"points"]
                                            gallery:dict[@"pictures"]
                                           category:dict[@"categories"]];
    }
    
//    for (NSDictionary* dict in pointsArray) {
//        [[Database instance] addNodeEntityWithObj_id:dict[@"id"]
//                                                name:dict[@"name"]
//                                                time:dict[@"time"]
//                                                 pin:dict[@"pinPicture"]
//                                              routes:<#(NSSet<Route *> * _Nonnull)#>];
//    }
    
    
}

@end
