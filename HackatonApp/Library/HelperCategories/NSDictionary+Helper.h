//
//  NSDictionary+Helper.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Helper)

- (id) safeValueForKey:(NSString *)key;

- (NSString*) safeStringValueForKey:(NSString*)key;

- (NSInteger) safeIntegerForKey:(NSString*)key;

- (BOOL) safeBoolForKey:(NSString*)key;
- (BOOL) safeBoolForKey:(NSString*)key defaultValue:(BOOL)defaultValue;

- (NSDictionary*) safeDictionaryForKey:(NSString*)key;

- (NSArray*) safeArrayForKey:(NSString*)key;

- (NSNumber*) safeNumberForKey:(NSString*)key;

- (NSString*) lis_getJSONStringPretty:(BOOL)prettyPrinted;


@end
