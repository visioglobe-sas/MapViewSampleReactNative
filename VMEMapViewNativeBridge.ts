import { NativeModules} from 'react-native';
const { VMEMapViewNativeBridge } = NativeModules
interface VMEMapViewNativeBridgeInterface {
   queryAllPlaceIDs(): void;
   setPlacesColor(pPlacesIdColor: {string: string }): void;
   resetPlacesColor(pPlacesId: [string]): void;
   setPlaceColor(pPlaceId: string, pColor : string): void;
   resetPlaceColor(pPlaceId: string): void;
}
export default VMEMapViewNativeBridge as VMEMapViewNativeBridgeInterface;