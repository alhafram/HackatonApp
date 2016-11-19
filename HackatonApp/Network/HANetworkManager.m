//
//  HANetworkManager.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HANetworkManager.h"

@implementation HANetworkManager

+ (instancetype)sharedInstance {
    static HANetworkManager* sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HANetworkManager alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super initWithBaseURL:[NSURL URLWithString:kHAServerBasePath]];
    if (self) {
        
        self.operationQueue.maxConcurrentOperationCount = NSOperationQueueDefaultMaxConcurrentOperationCount;
    }
    return self;
}

#pragma mark - General Methods -

+ (NSString *)getBasePath {
    return kHAServerBasePath;
}

- (void)prepareWithRequestSerializerType:(HASerializerType)requestSerType responseSerializerType:(HASerializerType)responseSerType {
    self.requestSerializer = [self getRequestSerializerForType:requestSerType];
    self.responseSerializer = [self getResponserSerializerForType:responseSerType];
}

- (void)prepareWithDefaultSerializers {
    [self prepareWithRequestSerializerType:HASerializerTypeJSON responseSerializerType:HASerializerTypeJSON];
}

- (id)getRequestSerializerForType:(HASerializerType)serType {
    id serializer = nil;
    switch (serType) {
            case HASerializerTypeHTTP:
            serializer = [AFHTTPRequestSerializer serializer];
            break;
            case HASerializerTypeJSON:
            serializer = [AFJSONRequestSerializer serializer];
            break;
            
        default:
            break;
    }
    return serializer;
}

- (id)getResponserSerializerForType:(HASerializerType)serType {
    id serializer = nil;
    switch (serType) {
            case HASerializerTypeHTTP:
            serializer = [AFHTTPResponseSerializer serializer];
            break;
            case HASerializerTypeJSON:
            serializer = [AFJSONResponseSerializer serializer];
            break;
            
        default:
            break;
    }
    return serializer;
}


@end
