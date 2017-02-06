//
//  PANativeModule.m
//  PANativeModule
//
//  Created by passol on 17/2/6.
//  Copyright © 2017年 小啤酒. All rights reserved.
//

#import "PANativeModule.h"



@implementation PANativeModule

RCT_EXPORT_MODULE(PANativeModuleExample);

RCT_EXPORT_METHOD(testPrint:(NSString *)name info:(NSDictionary *)info) {
    RCTLogInfo(@"%@: %@", name, info);
}

RCT_EXPORT_METHOD(getNativeClass:(RCTResponseSenderBlock)callback) {
    callback(@[NSStringFromClass([self class])]);
}

RCT_REMAP_METHOD(testRespondMethod,
                 name:(NSString *)name
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject) {
    if([self respondsToSelector:NSSelectorFromString(name)]) {
        resolve(@YES);
    }
    else {
        reject(@"-1001", @"not respond this method", nil);
    }
}


- (NSDictionary *)constantsToExport {
    return @{ @"BGModuleName" : @"BGNativeModuleExample",
              @"TestEventName": @"TestEventName"
              };
}



@end
