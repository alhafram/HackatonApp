//
//  HAErrorHelper.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HAErrorHelper.h"
#import "NSDictionary+Helper.h"

@implementation HAErrorHelper

+ (NSError *)errorFromServerDescription:(NSDictionary *)errorDict {
    if (![errorDict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSInteger status = [errorDict safeIntegerForKey:@"status"];
    NSString* errorDescription = [errorDict safeStringValueForKey:@"error"];
    NSError* error = [[NSError alloc] initWithDomain:@"PAServerErrorDomain" code:status userInfo:@{NSLocalizedDescriptionKey : errorDescription}];
    
    return error;
}

@end
