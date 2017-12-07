//
//  PrivateAPIManager.h
//  amfetamine
//
//  Created by Sem Voigtländer on 29/11/2017.
//  Copyright © 2017 Sem Voigtländer. All rights reserved.
//
#import <Foundation/Foundation.h>
#define SUPPRESS_UNDECLARED_SELECTOR_LEAK_WARNING(code)                        \
_Pragma("clang diagnostic push")                                        \
_Pragma("clang diagnostic ignored \"-Wundeclared-selector"\"")     \
code;                                                                   \
_Pragma("clang diagnostic pop")

@interface PrivateAPI : NSObject
+ (BOOL)loadPrivateAPIWithPath:(NSString*)path;
@end
/* PrivateAPIManager_h */
