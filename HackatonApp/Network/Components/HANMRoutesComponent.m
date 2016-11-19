//
//  HANMRoutesComponent.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HANMRoutesComponent.h"

#define kHAServerRoutesPath @"routes"

@implementation HANMRoutesComponent

-(void)getAllRouteseWithCompletionBlock:(HARequestCompletionBlock)completionBlock {
    [self startOperation:HANMOperationTypeGET path:kHAServerRoutesPath parameters:nil operationLogName:@"GetAllRoutes" completionBlock:completionBlock logEnabled:YES];
}

- (void)getRoutesByCategoriesId:(NSArray *)categories completionBlock:(HARequestCompletionBlock)completionBlock {
    NSMutableDictionary* params = [NSMutableDictionary new];
    NSString* paramString = @"";
    
    for (int i = 0; i < categories.count; i++) {
        NSNumber* categoryId = categories[i];
        if (i == categories.count - 1) {
            paramString = [paramString stringByAppendingString:[NSString stringWithFormat: @"%@", categoryId]];
        } else {
            paramString = [paramString stringByAppendingString:[NSString stringWithFormat: @"%@,", categoryId]];
        }
    }
    
    params[@"categories"] = paramString;
    [self startOperation:HANMOperationTypeGET path:kHAServerRoutesPath parameters:params operationLogName:@"GetRoutesByCategory" completionBlock:completionBlock logEnabled:YES];
}

@end
