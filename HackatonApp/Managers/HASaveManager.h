//
//  HASaveManager.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HASaveManager : NSObject

+ (HASaveManager *)sharedInstance;
- (void)saveImageByName:(NSString *)imageName;
- (UIImage *)getImageByName:(NSString *)imageName;

@end
