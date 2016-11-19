//
//  HANMRoutesComponent.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HANMBaseComponent.h"

@interface HANMRoutesComponent : HANMBaseComponent

- (void)getAllRouteseWithCompletionBlock:(HARequestCompletionBlock)completionBlock;
- (void)getRoutesByCategoriesId:(NSArray *)categories completionBlock:(HARequestCompletionBlock)completionBlock;

@end
