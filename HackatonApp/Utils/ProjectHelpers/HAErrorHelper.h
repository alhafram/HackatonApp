//
//  HAErrorHelper.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HAErrorHelper : NSObject

+ (NSError *)errorFromServerDescription:(NSDictionary *)errorDict;

@end
