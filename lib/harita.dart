
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class Harita extends StatefulWidget{
  @override
  _HaritaState createState()=> _HaritaState();
}

class _HaritaState extends State<Harita>{
  static const _initialCameraPosition=CameraPosition(
      target: LatLng(40.765442, 29.940809),
      zoom: 11.5,
  );

  late GoogleMapController _googleMapController;
  Marker? _origin;
  Marker? _destination;

  @override
  void dispose(){
    _googleMapController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle:  false,
        title: const Text('Goggle Maps'),
        actions: [
          if (_origin != null)
          TextButton(onPressed: () => _googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: _origin!.position,
                    zoom: 14.5,
                  tilt: 50.0,
                ),
            ),
          ),
            style: TextButton.styleFrom(
              primary: Colors.green,
              textStyle:  const TextStyle(fontWeight: FontWeight.w600),
            ),
            child: const Text('ORIGIN'),
          ),
          if(_destination != null)
            TextButton(onPressed: ()=> _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: _destination!.position,
                    zoom: 14.5,
                      tilt: 50.0,
                    ),
                ),
            ),
              style: TextButton.styleFrom(
                primary: Colors.blue,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('DEST'),
            )
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        initialCameraPosition: _initialCameraPosition ,
        onMapCreated: (controller)=> _googleMapController=controller,
        markers: {
          if (_origin != null) _origin!,
          if (_destination != null) _destination!
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: ()=> _googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(_initialCameraPosition),
    ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }




  void _addMarker(LatLng pos) {
    if (_origin == null || (_origin != null && _destination != null)){
      setState(() {
        _origin=Marker(
            markerId:const MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'KONUMUNUZ'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
        );
        _destination==null;
      });
    }
    else {
      setState(() {
        _destination=Marker(
          markerId: const MarkerId('destination'),
        infoWindow:const InfoWindow(title: 'HEDEF KONUM'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: pos,
        );
      });
    }
  }
}