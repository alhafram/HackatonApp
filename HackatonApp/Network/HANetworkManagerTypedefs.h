//
//  HANetworkManagerTypedefs.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#ifndef HANetworkManagerTypedefs_h
#define HANetworkManagerTypedefs_h

typedef NS_ENUM(NSUInteger, HASerializerType) {
    HASerializerTypeHTTP,
    HASerializerTypeJSON
};

typedef void(^HARequestCompletionBlock)(BOOL success, NSError* error, id responseData);

#endif /* HANetworkManagerTypedefs_h */
