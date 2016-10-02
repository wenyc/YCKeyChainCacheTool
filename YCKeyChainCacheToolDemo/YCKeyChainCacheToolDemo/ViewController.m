//
//  ViewController.m
//  YCKeyChainCacheToolDemo
//
//  Created by 温玉超 on 16/9/30.
//  Copyright © 2016年 温玉超. All rights reserved.
//

#import "ViewController.h"
#import "YCKeyChainCacheTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    /* NOTE:if you want test this example ,please use iphone instead iphone simulator */
    
    //-------------------save-----------------------
    [self savePasswordToKeychain];
    [self getPasswordFromKeychain];
    
    //------------------delete----------------------
//    [self deletePasswordFromkeychian];
//    [self getPasswordFromKeychain];
}

- (void)savePasswordToKeychain {
    NSString *password = @"w123456";
    NSString *userNameKey = @"Mr.wen";
    [YCKeyChainCacheTool cacheValue:password forKey:userNameKey];
}

- (void)getPasswordFromKeychain {
    NSString *userNameKey = @"Mr.wen";
    NSString *password = [YCKeyChainCacheTool loadCacheValueForKey:userNameKey];
    NSLog(@"the user`s password is %@",password);
}

- (void)deletePasswordFromkeychian {
    NSString *userNameKey = @"Mr.wen";
    [YCKeyChainCacheTool deleteCacheValueForKey:userNameKey];
}
@end
