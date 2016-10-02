//
//  YCKeyChainCacheTool.h
//  YCKeyChainCacheToolDemo
//
//  Created by 温玉超 on 16/9/30.
//  Copyright © 2016年 温玉超. All rights reserved.
//

#import <Foundation/Foundation.h>
#define accessGroupItem @"W89ABTKW89.wenyuchao.GenericKeychainSuite"

@interface YCKeyChainCacheTool : NSObject

/**
 *  缓存信息到keyChain
 */
+ (BOOL)cacheValue:(id)value forKey:(NSString *)key;

/**
 *  从keyChain获取缓存信息
 */
+ (id)loadCacheValueForKey:(NSString *)key;

/**
 * 从keyChain删除缓存信息
 */
+ (BOOL)deleteCacheValueForKey:(NSString *)key;
@end
