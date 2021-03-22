import PropTypes from 'prop-types';
import React from 'react';
import { requireNativeComponent, NativeModules,NativeEventEmitter} from 'react-native';

import VMEMapViewNativeBridge from './VMEMapViewNativeBridge';
class VMEMapView extends React.Component {
  constructor(props){
    super(props);
    this.eventEmitter = new NativeEventEmitter(NativeModules.VMEMapEvent);
    this.callIndex = 0;
    this.onMapEventReceived = this.eventEmitter.addListener('onMapEventReceived',  (event) => {
      switch (event.name) {
      	case "onMapDidInitializeEngine":
          console.log('onMapDidInitializeEngine', event);
      		break;
      	case "onMapDidLoad":
          console.log('onMapDidLoad', event);
      		break;
        case "onMapDidGainFocus":
          console.log('onMapDidGainFocus', event);
          break;
        case "onMapDidDisplayRouteSetup":
          console.log('onMapDidDisplayRouteSetup', event);
          break;
        case "onMapDidDisplayRoute":
          console.log('onMapDidDisplayRoute', event);
          break;
        case "onMapDidDisplaySearch":
          console.log('onMapDidDisplaySearch', event);
          break;
        case "onMapDidDisplayPlaceInfo":
          console.log('onMapDidDisplayPlaceInfo', event);
          break;
      	case "onMapDidSelectPlace":
      		console.log('onMapDidSelectPlace', event);
      		break;
        case "onMapDidSelectBuilding":
      		console.log('onMapDidSelectBuilding', event);
      		break;
      }
    });
  }
  
  render() {
    return <VMEMapViewNative {...this.props} />;
  }

  queryAllPlaces = async () => {
    try {
      const allPlaces = await VMEMapViewNativeBridge.queryAllPlaces();
      if(this.callback !== undefined){
        this.callback(allPlaces);
      }
    } catch (e) {
      console.error(e);
    }
  };

  setPlacesColor = async (pPlacesIdColor) => {
    VMEMapViewNativeBridge.setPlacesColor(pPlacesIdColor);   
  }

  resetPlacesColor = async(pPlacesId) => {
    VMEMapViewNativeBridge.resetPlacesColor(pPlacesId);
  }  

  setPlaceColor = async(pPlaceId,color) => {
    VMEMapViewNativeBridge.setPlaceColor(pPlaceId,color);
  }  

  resetPlaceColor = async(pPlaceId) => {
    VMEMapViewNativeBridge.resetPlaceColor(pPlaceId);
  }  
  
}

VMEMapView.propTypes = {
  sharedVMEProperties: PropTypes.object
};

var VMEMapViewNative = requireNativeComponent('VMEMapViewNative', VMEMapView);

module.exports = VMEMapView;