//
//  HANMBaseComponent.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HANetworkManagerTypedefs.h"
@class HANetworkManager;
@class AFHTTPRequestOperation;
@protocol AFMultipartFormData;

typedef NS_ENUM(NSUInteger, HANMOperationType) {
    HANMOperationTypeGET = 0,
    HANMOperationTypePOST,
    HANMOperationTypeDELETE,
    HANMOperationTypeMultipartForm
};


@interface HANMBaseComponent : NSObject

@property (weak, readonly, nonatomic) HANetworkManager* netManager;

- (instancetype)initWithNetManager:(HANetworkManager *)netManager;
- (AFHTTPRequestOperation *)startOperation:(HANMOperationType)operationType path:(NSString *)path parameters:(id)parameters operationLogName:(NSString *)logName completionBlock:(HARequestCompletionBlock)completionBlock logEnabled:(BOOL)logEnabled constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block;
- (AFHTTPRequestOperation *)startOperation:(HANMOperationType)operationType path:(NSString *)path parameters:(id)parameters operationLogName:(NSString *)logName completionBlock:(HARequestCompletionBlock)completionBlock logEnabled:(BOOL)logEnabled;
- (void)cancelCurrentOperaions;

@end
