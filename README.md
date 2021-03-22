# MapViewSampleReactNative
This project is a sample to show how to use VisioMoveEssential SDK with React Native.

Currently, only iOS (swift) version is available.

## Run the project - iOS
* cd MapViewSampleReactNative/ios/
* npm install
* pod install
* If you have a licence, dowload the SDK in Visioglobe developer site
* In the dowloaded folder, copy VisioMoveEssential.xcframework, VisioMoveEssential.bundle and VisioMoveEssentialStrings.bundle and add them to the ios folder
* Open the MapViewSampleReactNative.xcworkspace
* Build the project, if the "VisioMoveEssential.xcframework" is still missing but you have already added it, you can make a "clean" before rebuilding. 
* If necessary, add your signing capabilities



## Current available APIs and Listeners - iOS
### Apis 
* [queryAllPlaceIDs()](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_gafee04158e17605293966d8a3a96b3ace.html#gafee04158e17605293966d8a3a96b3ace)
* [setPlacesColor(pPlacesIdColor: {string: string })](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_ga9beebd1355e0cc72fb301a03fb0dd370.html#ga9beebd1355e0cc72fb301a03fb0dd370)
* [setPlaceColor(pPlaceId: string, pColor : string)](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_gaae5ce98dbb1d26995a4cc01648281081.html#gaae5ce98dbb1d26995a4cc01648281081)
* [resetPlacesColor(pPlacesId: {string})](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_ga225d411d206d2538eb479ffe3b8eb3d8.html#ga225d411d206d2538eb479ffe3b8eb3d8)
* [resetPlaceColor(pPlaceId: string)](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/group__place_info_inteface_gac33bf16d311b2bd0c5d7c7bb3dfad859.html#gac33bf16d311b2bd0c5d7c7bb3dfad859)


### Listeners
* [VMELifeCycleListener](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_life_cycle_listener-p.html)
* [VMEPlaceListener](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_place_listener-p.html)
* [VMEBuildingListener](https://developer.visioglobe.com/docs/VisioMoveEssential-iOS/Doc/VisioMoveEssential-iOS/html/protocol_v_m_e_building_listener-p.html)

