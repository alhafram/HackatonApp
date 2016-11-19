//
//  SettingsManager.h
//  HackatonApp
//
//  Created by Albert on 19/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HASettingsManager : NSObject

@property (strong, nonatomic) NSArray* categories;

+ (HASettingsManager*) sharedManager;

- (void) setCategories:(NSArray*) categories withName:(NSString*) keyName;
- (NSArray*) getCategories:(NSString*) name;



@end
