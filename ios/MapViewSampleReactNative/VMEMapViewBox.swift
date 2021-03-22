//
//  VMEMapViewBox.swift
//  MapViewSampleReactNative
//
//  Created by Visioglobe.
//

import Foundation
import UIKit
import VisioMoveEssential
import AVFoundation

class VMEMapViewBox: UIView {
  
  @objc var sharedVMEProperties: Dictionary<String,Any> = [:]
  var mMapView: VMEMapView!
  
  var mapListners = [String]()
  
  override init(frame:CGRect) {
    super.init(frame: frame)
    mMapView = VMEMapView.init()
    mMapView.frame = frame
    self.addSubview(mMapView)
  }
  func getMapView()->VMEMapView{
    return mMapView
  }
  override func didSetProps(_ changedProps: [String]!) {
    for property in self.sharedVMEProperties {
      if(property.key.elementsEqual("mapHash")){
        mMapView.mapHash = property.value as! String
      }else if(property.key.elementsEqual("mapPath")){
        mMapView.mapPath = property.value as! String
      }else if(property.key.elementsEqual("mapSecretCode")){
        mMapView.mapSecretCode = property.value as! Int32
      }else if(property.key.elementsEqual("listeners")){
        mapListners = property.value as![String]
      }
    }
  }
  override func didMoveToWindow() {
    mMapView.translatesAutoresizingMaskIntoConstraints = false
    mMapView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    mMapView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    let screenSize: CGRect = UIScreen.main.bounds
    mMapView.widthAnchor.constraint(equalToConstant: screenSize.width).isActive = true
    mMapView.heightAnchor.constraint(equalToConstant: screenSize.height*0.8).isActive = true
    mMapView.loadMap()
  }
  override func didMoveToSuperview() {
  }
  override func didUpdateReactSubviews() {
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
