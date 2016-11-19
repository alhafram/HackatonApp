//
//  SettingsManager.m
//  HackatonApp
//
//  Created by Albert on 19/11/16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HASettingsManager.h"

@implementation HASettingsManager

+ (id)sharedManager {
    
    static HASettingsManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}


- (void) setCategories:(NSArray*) categories withName:(NSString*) keyName {
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:categories forKey:keyName];
    [ud synchronize];
}

- (NSArray*) getCategories:(NSString*) name {
    
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    return [ud objectForKey:name];
}

@end
