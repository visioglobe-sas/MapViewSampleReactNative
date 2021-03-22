//
//  VMEMapViewNativeModule.m
//  MapViewSampleReactNative
//
//  Created by Visioglobe.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(VMEMapViewNativeBridge,NSObject)

RCT_EXTERN_METHOD(queryAllPlaceIDs:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(setPlacesColor:(NSDictionary*<NSString*,NSString*>)pPlacesIdColor)

RCT_EXTERN_METHOD(setPlaceColor:(NSString*)pPlaceID color:(NSString*)pColor)

RCT_EXTERN_METHOD(resetPlacesColor: (NSArray*<NSString*>)pPlacesId)

RCT_EXTERN_METHOD(resetPlaceColor: (NSString*)pPlaceID)
@end
