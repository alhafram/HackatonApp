//
//  NSDictionary+Helper.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "NSDictionary+Helper.h"

@implementation NSDictionary (Helper)

- (id) safeValueForKey:(NSString *)key {
    id someObject = [self valueForKey:key];
    if ([someObject isEqual:[NSNull null]]) {
        return nil;
    }
    
    return someObject;
}

- (NSString*) safeStringValueForKey:(NSString*)key {
    id someValue = [self safeValueForKey:key];
    if (someValue && [someValue isKindOfClass:[NSString class]]) {
        return someValue;
    } else if ([someValue isKindOfClass:[NSNumber class]]) {
        return [someValue stringValue];
    }
    
    return @"";
}

- (NSInteger) safeIntegerForKey:(NSString*)key {
    id someValue = [self safeValueForKey:key];
    if (someValue) {
        return [someValue integerValue];
    }
    
    return 0;
}

- (BOOL) safeBoolForKey:(NSString*)key {
    return [self safeBoolForKey:key defaultValue:NO];
}

- (BOOL) safeBoolForKey:(NSString*)key defaultValue:(BOOL)defaultValue {
    id someValue = [self safeValueForKey:key];
    if (someValue) {
        return [someValue boolValue];
    }
    
    return defaultValue;
}

- (NSDictionary*) safeDictionaryForKey:(NSString*)key {
    id someValue = [self safeValueForKey:key];
    if (someValue && [someValue isKindOfClass:[NSDictionary class]]) {
        return someValue;
    }
    
    return nil;
}

- (NSArray*) safeArrayForKey:(NSString*)key {
    id someValue = [self safeValueForKey:key];
    if (someValue && [someValue isKindOfClass:[NSArray class]]) {
        return someValue;
    }
    
    return nil;
}

- (NSNumber*) safeNumberForKey:(NSString*)key {
    id someValue = [self safeValueForKey:key];
    if (someValue) {
        return @([someValue floatValue]);
    }
    
    return nil;
}

- (NSString*) lis_getJSONStringPretty:(BOOL)prettyPrinted {
    NSError* error;
    NSJSONWritingOptions options = (prettyPrinted) ? NSJSONWritingPrettyPrinted : 0;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:self options:options error:&error];
    
    if (error) {
        MLOG(@"JSON serialization error: %@", error.localizedDescription);
        return @"{}";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

@end
