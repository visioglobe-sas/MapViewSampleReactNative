import React, {Component} from 'react';
import {StyleSheet, View, TouchableOpacity,Text,SafeAreaView} from 'react-native';
import VMEMapView from './VMEMapView.js';

const randomColor = () => {
  let color = '#';
  for (let i = 0; i < 6; i++){
     const random = Math.random();
     const bit = (random * 16) | 0;
     color += (bit).toString(16);
  };
  return color;
};
export default class App extends Component {
  constructor(props) {
    super(props);
    this.mMapView = React.createRef();
    this.listeners = ["onMapDidLoad","onMapDidSelectPlace","onMapDidSelectBuilding"];
    this.vmeProps = {mapHash:"mc8f3fec89d2b7283d15cfcf4eb28a0517428f054", listeners:this.listeners};
  }
  
  render() {
    var pPlaceIdColors = [ "B4-UL05-ID0032","B2-LL01-ID0011","B3-UL00-ID0070","B1-UL00-ID0039"]
    return (
      <SafeAreaView style={styles.container}>
        <VMEMapView style={styles.mapview} sharedVMEProperties={this.vmeProps} ref={this.mMapView} />
        <View style={styles.buttoncontainer}>
          
          <TouchableOpacity style={styles.button} onPress={() => {
            let newColor = randomColor();
            this.mMapView.current.queryAllPlaceIDs();

            var _this = this;

            this.mMapView.current.callback = (places) => {
              var placesIdsColors = {};
              places.forEach(placeId => {
                placesIdsColors[placeId]= newColor;
              });
              _this.mMapView.current.setPlacesColor(placesIdsColors);
            }
          }
          } >
            <Text style={styles.buttonText}>All places color</Text>
          </TouchableOpacity>

          <TouchableOpacity style={styles.button} onPress={() => {
            pPlaceIdColors.forEach(placeId => {
              this.mMapView.current.setPlaceColor(placeId,"#00ff00")
            });
          }
          }>
            <Text style={styles.buttonText}>Some places color</Text>
          </TouchableOpacity>
          <TouchableOpacity style={styles.button} onPress={() => {
            this.mMapView.current.queryAllPlaceIDs();

            var _this = this;

            this.mMapView.current.callback = (places) => {
              var placesIds = [];
              for (let i = 0; i < places.length; i++) {
                const element = places[i];
                placesIds[i]= element;                
              }
              _this.mMapView.current.resetPlacesColor(placesIds);
            }
          }
          }>
            <Text style={styles.buttonText}>Reset</Text>
          </TouchableOpacity>
        </View>
      </SafeAreaView>
    );
  }
}
const styles = StyleSheet.create({
  container: {
    height:'100%',
    width:'100%',
  },
  buttoncontainer :{
    width:'100%',
    height:'10%',
    justifyContent: 'center',
    flexDirection:"row"
  },
  mapview: {
    height:'90%'
  },
  button:{
    marginRight:5,
    marginLeft:5,
    height:'52x%',
    padding:10,
    backgroundColor:'#0dc7e7',
    borderRadius:10,
    borderWidth: 1,
    borderColor: '#fff'
},
buttonText:{
  color:'white',
  fontWeight:'600',
  textAlign:'center',
},
});