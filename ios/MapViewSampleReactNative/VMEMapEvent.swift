//
//  VMEMapEvent.swift
//  MapViewSampleReactNative
//
//  Created by Visioglobe.
//
import React

@objc(VMEMapEvent)
open class VMEMapEvent: RCTEventEmitter {
  var hasListeners:Bool = false
  private static var sharedInstance: VMEMapEvent!
  static func getSharedInstance() -> VMEMapEvent {
    if(nil == VMEMapEvent.sharedInstance){
      VMEMapEvent.sharedInstance = VMEMapEvent()
    }
    return VMEMapEvent.sharedInstance
  }
  
  private override init() {
    super.init()
    VMEMapEvent.sharedInstance = self
  }
  
  open override func supportedEvents() -> [String]! {
    return ["onDataReceived",
            "onMapEventReceived"]
  }
  
  open override class func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  open override func startObserving() {
    hasListeners = true
  }
  
  open override func stopObserving() {
    hasListeners = false
  }
  
  func sendMapEvents(withName name: String!, body: Any!){
    if (!hasListeners) {
      return;
    }
    sendEvent(withName: name, body: body)
  }
}
