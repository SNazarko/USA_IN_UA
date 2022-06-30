import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../repositories/located_repositories.dart';

class ProfileGoogleMapsPage extends StatefulWidget {
  const ProfileGoogleMapsPage({Key? key}) : super(key: key);
  static const routeName = '/profile_google_maps_page';

  @override
  State<ProfileGoogleMapsPage> createState() => _ProfileGoogleMapsPageState();
}

class _ProfileGoogleMapsPageState extends State<ProfileGoogleMapsPage> {
  Completer<GoogleMapController> _controller = Completer();
Marker? _origin;
Marker? _destination;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          if(_origin != null) _origin!,
          if(_destination != null) _destination!
        },
        onLongPress: _addMarker,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 45.0,),
        child: FloatingActionButton(
          onPressed: ()=> _goToTheLake(),
          child: const Icon(Icons.my_location,size: 35.0,),
        ),
      ),
    );
  }

  void _addMarker (LatLng pos){
    setState((){
      _origin = Marker(markerId: MarkerId('origin'),
        infoWindow: const InfoWindow(title: 'origin',),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,);

    });
  LocatedRepositories.instance.getDirections(
      origin: _origin!.position);
  }

  Future<void> _goToTheLake() async {
    final _kLakeMy = await LocatedRepositories.instance.getLocation();
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLakeMy));
  }

}