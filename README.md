# YCKeyChainCacheTool
**YCKeyChainCacheTool**

----------
This KeyChain is enclosured to this class,which is aimed at developer convenient to use.
YCKeyChainCacheTool is a tool class,which can save sensitive data to KeyChain,such as password,certificate.If you have more than one applications which can use one password to login, you can use this class to convince user to login. This is to say ,if user login one of applications , the other application can be loginned automicly when the application is launched.

**Getting Started**

----------
Using CocoaPods
1. Add the pod YCKeyChainCacheTool to your Podfile.
```
pod 'YCKeyChainCacheTool', '~> 1.0.0'
```
2.Run pod install from Terminal, then open your app's .xcworkspace file to launch Xcode.

3.#import YCKeyChainCacheTool.h wherever you want to use the API.

**Example Usage**

----------
It is very easy to use.Just like this.

 

 - use account as key and save password to keyChain 
```
[YCKeyChainCacheTool cacheValue:enPassword forKey:accountDict[@"account"]];
```
 - get the password from the keyChain 
```
NSString *account = [YCKeyChainCacheTool loadCacheValueForKey:@"account"];
```

 - delete the password from the keyChain 
```
[self deleteCacheValueForKey:@"account"];
```
**Note**
In this class ,if you want share data among applicationsyou have to use your own developer ID to replace the string (`#define accessGroupItem @"W89ABTKW89.wenyuchao.GenericKeychainSuite"`) . 

**License**

----------
MIT

  
