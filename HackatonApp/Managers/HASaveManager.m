//
//  HASaveManager.m
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import "HASaveManager.h"

#define path [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Images"]

@implementation HASaveManager

+ (HASaveManager *)sharedInstance {
    static dispatch_once_t onceToken;
    static HASaveManager* sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[HASaveManager alloc] init];
    });
    
    return sharedInstance;
}

- (void)saveImageByName:(NSString *)imageName {
    NSError* error = nil;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    NSLog(@"path: %@", path);
    
    NSData * binaryImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString: imageName]];
    
    NSString* fileName = [path stringByAppendingFormat:@"/%@", [imageName lastPathComponent]];
    [binaryImageData writeToFile:fileName atomically:YES];
}

- (UIImage *)getImageByName:(NSString *)imageName {
    
    NSString* fileName = [path stringByAppendingFormat:@"/%@", imageName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileName]) {
        return [UIImage imageNamed:@"picture_placeholder"];
    } else {
        return [UIImage imageWithContentsOfFile: fileName];
    }
}

@end
