
#import "React/RCTViewManager.h"
#import "React/RCTUIManager.h"
#import "React/RCTLog.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

@interface RCT_EXTERN_MODULE(VMEMapViewNative, RCTViewManager)

RCT_EXPORT_VIEW_PROPERTY(sharedVMEProperties, NSDictionary*)
@end


