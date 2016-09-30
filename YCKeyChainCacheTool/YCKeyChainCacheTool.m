//
//  YCKeyChainCacheTool.m
//  YCKeyChainCacheToolDemo
//
//  Created by 温玉超 on 16/9/30.
//  Copyright © 2016年 温玉超. All rights reserved.
//

#import "YCKeyChainCacheTool.h"
#define CHECK_OSSTATUS_ERROR(x) (x == noErr) ? YES : NO

@implementation YCKeyChainCacheTool

+ (BOOL)cacheValue:(id)value forKey:(NSString *)key {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    [keychainQuery setObject:accessGroupItem forKey:(id)kSecAttrAccessGroup];
    // delete any previous value with this key (we could use SecItemUpdate but its unnecesarily more complicated)
    [self deleteCacheValueForKey:key];
    
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:value] forKey:(__bridge id)kSecValueData];
    
    OSStatus result = SecItemAdd((__bridge CFDictionaryRef)keychainQuery, NULL);
    return CHECK_OSSTATUS_ERROR(result);
}

+ (id)loadCacheValueForKey:(NSString *)key {
    id value = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    CFDataRef keyData = NULL;
    
    [keychainQuery setObject:(__bridge id)kCFBooleanTrue forKey:(__bridge id)kSecReturnData];
    [keychainQuery setObject:(__bridge id)kSecMatchLimitOne forKey:(__bridge id)kSecMatchLimit];
    
    if (SecItemCopyMatching((__bridge CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            value = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }
        @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", key, e);
            value = nil;
        }
        @finally {}
    }
    
    if (keyData) {
        CFRelease(keyData);
    }
    
    return value;
}

+ (BOOL)deleteCacheValueForKey:(NSString *)key {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:key];
    
    OSStatus result = SecItemDelete((__bridge CFDictionaryRef)keychainQuery);
    return CHECK_OSSTATUS_ERROR(result);
}

#pragma mark - private
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)key {
    // see http://developer.apple.com/library/ios/#DOCUMENTATION/Security/Reference/keychainservices/Reference/reference.html
    return [@{(__bridge id)kSecClass            : (__bridge id)kSecClassGenericPassword,
              (__bridge id)kSecAttrService      : key,
              (__bridge id)kSecAttrAccount      : key,
              (__bridge id)kSecAttrAccessible   : (__bridge id)kSecAttrAccessibleAfterFirstUnlock
              } mutableCopy];
}
@end
