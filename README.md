# MapViewSampleReactNative
This project is a sample to show how to use VisioMoveEssential SDK with React Native.

Currently, only iOS (swift) version is available.

## Run the project - iOS
* cd MapViewSampleReactNative/
* npm install
* cd ios/
* pod install
* If you have a licence, dowload the SDK in [Visioglobe developer site](https://developer.visioglobe.com/visiomoveessential/)
* In the dowloaded folder, copy VisioMoveEssential.xcframework, VisioMoveEssential.bundle and VisioMoveEssentialStrings.bundle and add them to the ios folder
* Open the MapViewSampleReactNative.xcworkspace
* Build the project, if the "VisioMoveEssential.xcframework" is still missing but you have already added it, you can make a "clean" before rebuilding. 
* If necessary, add your signing capabilities

## Important classes - JS/TS
* VMEMapView.js
  Is a javascript file that is linked to the Native Ui Component VMEMapViewNative, you will find all the available VisioMoveEssential map events in there
* VMEMapViewNativeBridge.ts
  Is a typescript interface for the iOS bridge, you will find all the available VisioMoveEssential apis in there

## Important classes - iOS
* VMEMapViewNative.swift/VMEMapViewNative.m
  Is the Native UI Component that manages a VMEMapViewBox, a parent view of the SDK's VMEMapView.
* VMEMapViewNativeBridge.swift/VMEMapViewNativeBridge.m
  Is the Native Module that bridges all the VisioMoveEssential APIs to the VMEMapViewNativeBridge.ts
* VMEMapEvent.swift/VMEMapEvent.m
  Is the RCTEventEmitter that controlls all the map events happening. 

## Current available APIs and Listeners - iOS
### Apis 
* [queryAllPlaceIDs()](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_gafee04158e17605293966d8a3a96b3ace.html#gafee04158e17605293966d8a3a96b3ace)
* [setPlacesColor(pPlacesIdColor: {string: string })](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_ga9beebd1355e0cc72fb301a03fb0dd370.html#ga9beebd1355e0cc72fb301a03fb0dd370)
* [setPlaceColor(pPlaceId: string, pColor : string)](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_gaae5ce98dbb1d26995a4cc01648281081.html#gaae5ce98dbb1d26995a4cc01648281081)
* [resetPlacesColor(pPlacesId: {string})](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_ga225d411d206d2538eb479ffe3b8eb3d8.html#ga225d411d206d2538eb479ffe3b8eb3d8)
* [resetPlaceColor(pPlaceId: string)](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_gac33bf16d311b2bd0c5d7c7bb3dfad859.html#gac33bf16d311b2bd0c5d7c7bb3dfad859)

Here is an exemple on how you can call those APIs in your JS file : 
```javascript
  this.mMapView.current.queryAllPlaceIDs();
 ```

### Listeners
All events in those listeners can be listened. To listen one the map event, add its name to the VMEMapView properties. 
Map events names : 
* [VMELifeCycleListener](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p.html)

  [onMapDidInitializeEngine](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p_a40a7b7ba32023ecbf5a6e2a5524f69ed.html#a40a7b7ba32023ecbf5a6e2a5524f69ed)

  [onMapDidLoad](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p_a0c478f1bb016329d725510fa626740f6.html#a0c478f1bb016329d725510fa626740f6)

  [onMapDidGainFocus](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p_a97fe0735686f9dbc305977d06da7a5bd.html#a97fe0735686f9dbc305977d06da7a5bd)

  [onMapDidDisplayRouteSetup](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p_aae28f4e2033fd1ee6454938e515c8c03.html#aae28f4e2033fd1ee6454938e515c8c03)

  [onMapDidDisplayRoute](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p_a4f673f37292c1ac2596624a4a2589b68.html#a4f673f37292c1ac2596624a4a2589b68)

  [onMapDidDisplaySearch](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p_a05431431d73f13bcbb6b69c416af82fa.html#a05431431d73f13bcbb6b69c416af82fa)

  [onMapDidDisplayPlaceInfo](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p_aa6d503e88778a29f779939de75ab9e28.html#aa6d503e88778a29f779939de75ab9e28)
* [VMEPlaceListener](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_place_listener-p.html)

  [onMapDidSelectPlace](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_place_listener-p_aaf9b14e7f7946e64afc4ec9dc0ac72aa.html#aaf9b14e7f7946e64afc4ec9dc0ac72aa)
* [VMEBuildingListener](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_building_listener-p.html)

  [onMapDidSelectBuilding](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_building_listener-p_a5876017eef2962cf643f992740a221a4.html#a5876017eef2962cf643f992740a221a4)

## VMEMapView properties - iOS
In order to load the map, you must provide it with information, either a mapHash or/and a mapPath along with its secret code. If you provide a mapHash, before loading the map, the SDK will get the latest version in the Visioglobe map server and downloads it if necessary.
A mapPath is the path to where you put the embedded map if you have add it in the assets. 
See more info about the map properties [here](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__bundle_interface.html) and [here](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/index.html).

Here an example code on how to set the mapView properties : 
```javascript
 this.listeners = ["onMapDidLoad","onMapDidSelectPlace","onMapDidSelectBuilding"];
 this.vmeProps = {mapHash:"mc8f3fec89d2b7283d15cfcf4eb28a0517428f054", listeners:this.listeners};
 ```
 And when you set the view in render(), add those properties in sharedVMEProperties : 
 ```javascript
 <VMEMapView style={styles.mapview} sharedVMEProperties={this.vmeProps} ref={this.mMapView} />
 ```
 Note that by adding this.listeners in the this.vmeProps, you tell the map which listeners you want to listen to, in this example, we listen to "onMapDidLoad", "onMapDidSelectPlace" and "onMapDidSelectBuilding", to listens to other listeners, please add their name in this list.
 
 
 
 
