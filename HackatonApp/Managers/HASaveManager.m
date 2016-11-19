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

- (void)saveImage:(UIImage *)image byName:(NSString *)imageName {
    NSError* error = nil;
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:&error];
    }
    
    NSString* fileName = [path stringByAppendingFormat:@"/%@", imageName];
    NSData * binaryImageData = [NSData dataWithContentsOfURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@%@", kHAServerImagesPath, imageName]]];
    [binaryImageData writeToFile:fileName atomically:YES];
}

- (UIImage *)getImageByName:(NSString *)imageName {
    return [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", path, imageName]];
}

@end
