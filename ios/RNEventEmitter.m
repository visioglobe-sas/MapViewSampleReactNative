//
//  RNEventEmitter.m
//  MapViewSampleReactNative
//
//  Created by cedricvuillet on 16/03/2021.
//

#import <Foundation/Foundation.h>

#import "React/RCTViewManager.h"
#import "React/RCTUIManager.h"
#import "React/RCTLog.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>


@interface RCT_EXTERN_MODULE(ReactNativeEventEmitter, RCTEventEmitter)

RCT_EXTERN_METHOD(supportedEvents)

@end
