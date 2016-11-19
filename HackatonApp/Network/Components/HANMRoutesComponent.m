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
    
}

@end
