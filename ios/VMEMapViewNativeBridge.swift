//
//  VMEMapViewNativeModule.swift
//  MapViewSampleReactNative
//
//  Created by Visioglobe.
//

import React
import VisioMoveEssential

@objc(VMEMapViewNativeBridge)
open class VMEMapViewNativeBridge: NSObject, RCTBridgeModule {
  
  var mMapView : VMEMapView!
  
  public static func moduleName() -> String! {
    return "VMEMapViewNativeBridge"
  }
  private static var sharedInstance: VMEMapViewNativeBridge!
  
  static func getSharedInstance() -> VMEMapViewNativeBridge {
    if(nil == VMEMapViewNativeBridge.sharedInstance){
      VMEMapViewNativeBridge.sharedInstance = VMEMapViewNativeBridge()
    }
    return VMEMapViewNativeBridge.sharedInstance
  }
  
  public static func requiresMainQueueSetup() -> Bool {
    return false
  }
  
  private override init() {
    super.init()
    if( nil == VMEMapViewNativeBridge.sharedInstance){
      VMEMapViewNativeBridge.sharedInstance = self
    }
  }
  
  //Places
  @objc func queryAllPlaces(_ resolve: RCTPromiseResolveBlock, rejecter reject:RCTPromiseRejectBlock) -> Void {
    let res = VMEMapViewNativeBridge.sharedInstance.mMapView.queryAllPlaceIDs()
    if(!res.isEmpty){
      resolve(res)
    }else{
      reject("query_places_failure", "no places in map", nil);
    }
  }
  
  @objc func setPlacesColor(_ pPlacesIdColor: Dictionary<String,String>) -> Void {
    var lPlaceIdColor = [String : UIColor]()
    for entry in pPlacesIdColor {
      let lColor = UIColor.colorWithHexString(hexString: entry.value)
      lPlaceIdColor[entry.key] = lColor
    }
    VMEMapViewNativeBridge.sharedInstance.mMapView.setPlaceColor(lPlaceIdColor)
  }
  
  @objc func setPlaceColor(_ pPlaceID : String, color pColor : String) -> Void{
    let lColor = UIColor.colorWithHexString(hexString: pColor)
    VMEMapViewNativeBridge.sharedInstance.mMapView.setPlaceID(pPlaceID, color: lColor)
  }
  @objc func resetPlaceColor(_ pPlaceID : String) -> Void{
    VMEMapViewNativeBridge.sharedInstance.mMapView.resetPlaceIDColor(pPlaceID)
  }
  @objc func resetPlacesColor(_ pPlacesID : [String]) -> Void{
    VMEMapViewNativeBridge.sharedInstance.mMapView.resetPlaceColor(pPlacesID)
  }
}
