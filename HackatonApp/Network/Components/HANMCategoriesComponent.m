//
//  HANMCategoriesComponent.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HANMCategoriesComponent.h"

#define kHAServerCategoriesPath @"categories"

@implementation HANMCategoriesComponent

-(void)getAllRouteseWithCompletionBlock:(HARequestCompletionBlock)completionBlock {
    [self startOperation:HANMOperationTypeGET path:kHAServerCategoriesPath parameters:nil operationLogName:@"GetAllCategories" completionBlock:completionBlock logEnabled:YES];
}

@end
