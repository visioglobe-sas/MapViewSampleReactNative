//
//  VMEMapViewBoxManager.swift
//  MapViewSampleReactNative
//
//  Created by Visioglobe.
//

import Foundation
import VisioMoveEssential
import React

@objc(VMEMapViewNative)
class VMEMapViewNative: RCTViewManager,VMELifeCycleListener,VMEPlaceListener, VMEBuildingListener  {
  var mMapViewBox : VMEMapViewBox!
  var mMapView : VMEMapView!
  var mMapEvent : VMEMapEvent?
    
  override func view() -> UIView! {
    mMapViewBox = VMEMapViewBox.init()
    mMapView = mMapViewBox.getMapView()
    mMapView.lifeCycleListener = self
    mMapView.placeListener = self
    mMapView.buildingListener = self
    VMEMapEvent.getSharedInstance().bridge = self.bridge
    VMEMapViewNativeBridge.getSharedInstance().mMapView = mMapView
    return mMapViewBox
  }
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  private func getMapInfo(_ mapView: VMEMapView!)->[String:Any]{
    var mapInfo = [String : Any]()
    if(!mapView.mapHash.isEmpty){
      mapInfo["mapHash"] = mapView.mapHash
    }
    if(!mapView.mapPath.isEmpty){
      mapInfo["mapPath"] = mapView.mapPath
      mapInfo["mapSecretCode"] = mapView.mapSecretCode
    }
    return mapInfo
  }
    
  private func isListened(eventName : String)->Bool{
    if(!mMapViewBox.mapListners.isEmpty){
      for listener in mMapViewBox.mapListners {
        if(listener.elementsEqual(eventName)){
          return true
        }
      }
    }
    return false
  }
  
  private func getRouteResultDictionnary(result: VMERouteResult)-> Dictionary<String,Any>{
    var lRouteResult = Dictionary<String,Any>()
    /*lRouteResult["duration"] = result.duration
     lRouteResult["length"] = result.length
     lRouteResult["destinations"] = result.destinations
     
     
     var lRouteResultSegments = Dictionary<String,Any>()
     var lSegments = [Any]()
     for segment in result.segments {
     lRouteResultSegments["duration"] = segment.duration
     lRouteResultSegments["length"] = segment.length
     lRouteResultSegments["floorTransitionId"] = segment.floorTransitionId
     lRouteResultSegments["floorTransitionType"] = segment.floorTransitionType
     lRouteResultSegments["maneuverType"] = segment.maneuverType
     
     var lRouteResultSegmentsPath = [Any]()
     for path in segment.path {
     var positionToObject = Dictionary<String, Any>()
     var positionSceneContext = Dictionary<String,Any>()
     positionSceneContext["isOutside"] = path.scene.isOutside()
     positionSceneContext["buildingID"] = path.scene.buildingID
     positionSceneContext["floorID"] = path.scene.floorID
     
     positionToObject["altitude"] = path.altitude
     positionToObject["latitude"] = path.latitude
     positionToObject["longitude"] = path.longitude
     positionToObject["scene"] = positionSceneContext
     lRouteResultSegmentsPath.append(positionToObject)
     }
     
     lSegments.append(lRouteResultSegments)
     }
     
     lRouteResultSegments["path"] = lSegments
     lRouteResult["path"] =*/
    
    return lRouteResult
  }
  
  //VMELifeCycleListner
  func mapDidLoad(_ mapView: VMEMapView!) {
    if(isListened(eventName: "onMapDidLoad")){
      let loadResult : [String : Any] = ["name":"onMapDidLoad", "callIndex":0, "result":getMapInfo(mapView)]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: loadResult)
    }
  }
  
  func mapDidInitializeEngine(_ mapView: VMEMapView!) {
    if(isListened(eventName: "onMapDidInitializeEngine")){
      let initializeEngineResult : [String : Any] = ["name":"onMapDidInitializeEngine", "callIndex":0, "result":getMapInfo(mapView)]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: initializeEngineResult)
    }
  }
  
  func mapDidGainFocus(_ mapView: VMEMapView!) {
    if(isListened(eventName: "onMapDidGainFocus")){
      let gainFocusResult : [String : Any] = ["name":"onMapDidGainFocus", "callIndex":0, "result":getMapInfo(mapView)]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: gainFocusResult)
    }
  }
  
  func mapDidDisplayRouteSetup(_ mapView: VMEMapView!) {
    if(isListened(eventName: "onMapDidDisplayRouteSetup")){
      let displayRouteSetUpResult : [String : Any] = ["name":"onMapDidDisplayRouteSetup", "callIndex":0, "result":getMapInfo(mapView)]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: displayRouteSetUpResult)
    }
  }
  
  func map(_ mapView: VMEMapView!, didDisplayRoute result: VMERouteResult!) {
    if(isListened(eventName: "onMapDidDisplayRoute")){
      let displayRouteResult : [String : Any] = ["name":"onMapDidDisplayRoute", "callIndex":0, "result":[getMapInfo(mapView),getRouteResultDictionnary(result: result)]]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: displayRouteResult)
    }
  }
  
  func mapDidDisplaySearch(_ mapView: VMEMapView!) {
    if(isListened(eventName: "onMapDidDisplaySearch")){
      let displaySearchResult : [String : Any] = ["name":"onMapDidDisplaySearch", "callIndex":0, "result":getMapInfo(mapView)]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: displaySearchResult)
    }
  }
  
  func map(_ mapView: VMEMapView!, didDisplayPlaceInfo placeID: String!) {
    if(isListened(eventName: "onMapDidDisplayPlaceInfo")){
      let displayInfoResult : [String : Any] = ["name":"onMapDidDisplayPlaceInfo", "callIndex":0, "result":getMapInfo(mapView)]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: displayInfoResult)
    }
  }
  
  //VMEBuildingListener
  func map(_ mapView: VMEMapView!, didSelectBuilding buildingID: String!, with position: VMEPosition!) -> Bool {
    if(isListened(eventName: "onMapDidSelectBuilding")){
      var positionToObject = Dictionary<String, Any>()
      var positionSceneContext = Dictionary<String,Any>()
      positionSceneContext["isOutside"] = position.scene.isOutside()
      positionSceneContext["buildingID"] = position.scene.buildingID
      positionSceneContext["floorID"] = position.scene.floorID
      
      positionToObject["altitude"] = position.altitude
      positionToObject["latitude"] = position.latitude
      positionToObject["longitude"] = position.longitude
      positionToObject["scene"] = positionSceneContext
      
      let selectBuildingResult : [String : Any] = ["name":"onMapDidSelectBuilding", "callIndex":0, "result":[buildingID as Any,positionToObject]]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: selectBuildingResult)
    }
    return false
  }
  
  //VMEPlaceListener
  func map(_ mapView: VMEMapView!, didSelectPlace placeID: String!, with position: VMEPosition!) -> Bool {    
    if(isListened(eventName: "onMapDidSelectPlace")){
      var lPositionToObject = Dictionary<String, Any>()
      var lPositionSceneContext = Dictionary<String,Any>()
      lPositionSceneContext["isOutside"] = position.scene.isOutside()
      lPositionSceneContext["buildingID"] = position.scene.buildingID
      lPositionSceneContext["floorID"] = position.scene.floorID
      
      lPositionToObject["altitude"] = position.altitude
      lPositionToObject["latitude"] = position.latitude
      lPositionToObject["longitude"] = position.longitude
      lPositionToObject["scene"] = lPositionSceneContext
      
      let selectPlaceResult : [String : Any] = ["name":"onMapDidSelectPlace", "callIndex":0, "result":[placeID as Any,lPositionToObject]]
      VMEMapEvent.getSharedInstance().sendMapEvents(withName: "onMapEventReceived", body: selectPlaceResult)
    }
    return false
  }
}

extension UIColor {
  static func colorWithHexString(hexString: String) -> UIColor {
    var colorString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
    colorString = colorString.replacingOccurrences(of: "#", with: "").uppercased()
    let alpha: CGFloat = 1.0
    let red: CGFloat = self.colorComponentFrom(colorString: colorString, start: 0, length: 2)
    let green: CGFloat = self.colorComponentFrom(colorString: colorString, start: 2, length: 2)
    let blue: CGFloat = self.colorComponentFrom(colorString: colorString, start: 4, length: 2)
    
    let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    return color
  }
  static func colorComponentFrom(colorString: String, start: Int, length: Int) -> CGFloat {
    let startIndex = colorString.index(colorString.startIndex, offsetBy: start)
    let endIndex = colorString.index(startIndex, offsetBy: length)
    let subString = colorString[startIndex..<endIndex]
    let fullHexString = length == 2 ? subString : "\(subString)\(subString)"
    var hexComponent: UInt32 = 0
    
    guard Scanner(string: String(fullHexString)).scanHexInt32(&hexComponent) else {
      return 0
    }
    let hexFloat: CGFloat = CGFloat(hexComponent)
    let floatValue: CGFloat = CGFloat(hexFloat / 255.0)
    return floatValue
  }
}
