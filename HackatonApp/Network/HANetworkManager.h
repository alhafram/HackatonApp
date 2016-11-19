//
//  HANetworkManager.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "HANetworkManagerTypedefs.h"

@interface HANetworkManager : AFHTTPRequestOperationManager

@property (assign, nonatomic) NSInteger activeOperationCount;

+ (instancetype)sharedInstance;
+ (NSString *)getBasePath;
- (void) prepareWithRequestSerializerType:(HASerializerType)requestSerType responseSerializerType:(HASerializerType)responseSerType;
- (void) prepareWithDefaultSerializers;

@end
