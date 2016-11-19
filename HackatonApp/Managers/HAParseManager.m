//
//  HAParseManager.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HAParseManager.h"
#import "HASaveManager.h"
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
    
//    [[Database instance] resetDatabase];
    
    NSArray* pointsArray = responseData[@"points"];
    NSArray* routesArray = responseData[@"routes"];
    NSArray* categoriesArray = responseData[@"categories"];
    NSArray* picturesArray = responseData[@"pictures"];
    
    NSMutableSet* gallerySet = [NSMutableSet new];
    NSMutableSet* categoriesSet = [NSMutableSet new];
    NSMutableSet* nodesSet = [NSMutableSet new];
    
    for (NSDictionary* dict in picturesArray) {
        
        NSString* imageName = [dict[@"url"] lastPathComponent];
        [[HASaveManager sharedInstance] saveImageByName:dict[@"url"]];
        
        Gallery* gallery = [[Database instance] addGalleryEntityWithImage:imageName
                                                                   obj_id:[dict[@"id"] integerValue]];
        [gallerySet addObject:gallery];
    }
    
    for (NSDictionary* dict in categoriesArray) {
        RouteCategory* category = [[Database instance] addRouteCategoryEntityWithObj_id:[dict[@"id"] integerValue]
                                                                                   name:dict[@"name"]];
        [categoriesSet addObject:category];
    }
    
    for (NSDictionary* dict in pointsArray) {
        Node* node = [[Database instance] addNodeEntityWithObj_id:[dict[@"id"] integerValue]
                                                name:dict[@"name"]
                                                time:dict[@"time"]
                                                 pin:dict[@"pinPicture"]
                                                 coordinate:dict[@"coordinates"]];
        [nodesSet addObject:node];
    }

    for (NSDictionary* dict in routesArray) {
        
        NSString* imageName = [dict[@"cover"] lastPathComponent];
        [[HASaveManager sharedInstance] saveImageByName:imageName];
        
        [[Database instance] addRouteEntityWithName:dict[@"name"]
                                             rating:[dict[@"rating"] floatValue]
                                           duration:[dict[@"duration"] integerValue]
                                              price:[dict[@"price"] integerValue]
                                              cover:imageName
                                             obj_id:[dict[@"id"] integerValue]
                                              descr:dict[@"description"]
                                             points:nodesSet
                                            gallery:gallerySet
                                           category:categoriesSet];
    }
    
//    [[Database instance] resetDatabase];
}

@end
