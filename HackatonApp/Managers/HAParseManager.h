//
//  HAParseManager.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HAParseManager : NSObject

+ (HAParseManager *)sharedInstance;

- (void)parseRouteDictionary:(NSDictionary *)responseData;

@end
