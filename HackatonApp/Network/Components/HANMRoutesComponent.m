//
//  HANMRoutesComponent.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HANMRoutesComponent.h"
#import "HackatonApp-Swift.h"

#define kHAServerRoutesPath @"routes"

@implementation HANMRoutesComponent

-(void)getAllRouteseWithCompletionBlock:(HARequestCompletionBlock)completionBlock {
    
    NSMutableDictionary* params = [NSMutableDictionary new];
    NSString* paramString = @"";
    
    for (int i = 0; i < [[Database instance] getRoutesId].count; i++) {
        NSNumber* categoryId = [[Database instance] getRoutesId][i];
        if (i == [[Database instance] getRoutesId].count - 1) {
            paramString = [paramString stringByAppendingString:[NSString stringWithFormat: @"%@", categoryId]];
        } else {
            paramString = [paramString stringByAppendingString:[NSString stringWithFormat: @"%@,", categoryId]];
        }
    }
    
    params[@"alreadySaved"] = paramString;
    
    [self startOperation:HANMOperationTypeGET path:kHAServerRoutesPath parameters:params operationLogName:@"GetAllRoutes" completionBlock:completionBlock logEnabled:YES];
}

@end
