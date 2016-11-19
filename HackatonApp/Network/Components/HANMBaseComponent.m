//
//  HANMBaseComponent.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HANMBaseComponent.h"

#import "HANetworkManager.h"
#import "HAErrorHelper.h"

@interface HANMBaseComponent()
@property (weak, nonatomic) HANetworkManager* netManager;
@property (strong, nonatomic) NSMutableArray* currentOperations;
@end

@implementation HANMBaseComponent


#pragma mark - Initialization -

- (instancetype)initWithNetManager:(HANetworkManager *)netManager {
    self = [super init];
    if (self) {
        self.netManager = netManager;
        self.currentOperations = [NSMutableArray new];
    }
    return self;
}

#pragma mark - General Methods -

- (AFHTTPRequestOperation *)startOperation:(HANMOperationType)operationType
                                      path:(NSString *)path
                                parameters:(id)parameters
                          operationLogName:(NSString *)logName
                           completionBlock:(HARequestCompletionBlock)completionBlock
                                logEnabled:(BOOL)logEnabled
                 constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block {
    
    id success = ^(AFHTTPRequestOperation* operation, id responseObject) {
        [self.currentOperations removeObject:operation];
        self.netManager.activeOperationCount--;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = (self.netManager.activeOperationCount != 0);
        
        if (logEnabled) {
            MLOG(@"\n---> URL: %@ \n<--- ✅%@ response: %@ \n<--- MIME Type: %@", operation.request.URL, logName, responseObject, operation.response.MIMEType);
        }
        
        if (completionBlock) {
            completionBlock(YES, nil, responseObject);
        }
    };
    
    id failure = ^(AFHTTPRequestOperation* operation, NSError* error) {
        [self.currentOperations removeObject:operation];
        self.netManager.activeOperationCount--;
        [UIApplication sharedApplication].networkActivityIndicatorVisible = (self.netManager.activeOperationCount != 0);
        
        NSError* customError = [HAErrorHelper errorFromServerDescription:operation.responseObject];
        NSError* chosenError = (customError) ? : error;
        
        if (error.code == NSURLErrorCancelled) {
            chosenError = nil;
        }
        
        if (logEnabled) {
            if (error.code == NSURLErrorCancelled) {
                MLOG(@"\n---> URL: %@ \n<--- ❗️Operation Cancelled: %@", operation.request.URL, logName);
            } else {
                MLOG(@"\n---> URL: %@ \n<--- ❗️Error: %@ \n<--- %@ response: %@ \n<--- MIME Type: %@", operation.request.URL, chosenError.localizedDescription, logName, [[NSString alloc] initWithData:operation.responseData encoding:NSUTF8StringEncoding], operation.response.MIMEType);
            }
        }
        
        if (completionBlock) {
            completionBlock(NO, chosenError, operation.responseObject);
        }
    };
    
    AFHTTPRequestOperation* operation = nil;
    if (operationType == HANMOperationTypeGET) {
        operation = [self.netManager GET:path parameters:parameters success:success failure:failure];
    } else if (operationType == HANMOperationTypePOST) {
        operation = [self.netManager POST:path parameters:parameters success:success failure:failure];
    } else if (operationType == HANMOperationTypeDELETE) {
        operation = [self.netManager DELETE:path parameters:parameters success:success failure:failure];
    } else if (operationType == HANMOperationTypeMultipartForm) {
        operation = [self.netManager POST:path parameters:parameters constructingBodyWithBlock:block success:success failure:failure];
    }
    
    [self.currentOperations addObject:operation];
    self.netManager.activeOperationCount++;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    return operation;
}

- (AFHTTPRequestOperation *)startOperation:(HANMOperationType)operationType path:(NSString *)path parameters:(id)parameters operationLogName:(NSString *)logName completionBlock:(HARequestCompletionBlock)completionBlock logEnabled:(BOOL)logEnabled {
    
    return [self startOperation:operationType path:path parameters:parameters operationLogName:logName completionBlock:completionBlock logEnabled:logEnabled constructingBodyWithBlock:nil];
}

- (void)cancelCurrentOperaions {
    for (AFHTTPRequestOperation* operation in self.currentOperations) {
        [operation cancel];
    }
}


@end
