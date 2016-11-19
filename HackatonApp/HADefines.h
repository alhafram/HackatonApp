//
//  HADefines.h
//  HackatonApp
//
//  Created by Georgij on 19.11.16.
//  Copyright © 2016 Albert. All rights reserved.
//

// Logging
#if defined (DEBUG)
#define MLOG(fmt, args...) NSLog (@"%s (%d): " fmt, __PRETTY_FUNCTION__, __LINE__, ##args)
#else
#define MLOG(...)
#endif

// Strings macros
#define _s(className) NSStringFromClass([className class])

// Localizing
#define _(text) NSLocalizedString (text, nil)

//paths
#define kHAServerBasePath @"http://54.186.218.70:8000/"
//TODO: set path for images
#define kHAServerImagesPath @""

// Blocks
typedef void(^HAOperationCompletionBlock)(BOOL success, NSError *error);
typedef void(^HAOperationCompletionBlockWithData)(BOOL success, NSError *error, id userData);
typedef void(^HACompletionBlock)(void);

