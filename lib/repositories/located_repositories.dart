
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';


import '../services/located.dart';
import 'dart:async';

// "https://maps.googleapis.com/maps/api/directions/json?"
const apiKey = 'AIzaSyAEg2dVWnVPjrSDScV-LqGmdUKMsWT79PU';

class LocatedRepositories {
  LocatedRepositories._();
  static const String _baseUrl =
      "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?";

  static LocatedRepositories instance = LocatedRepositories._();
  final dio = Dio();

  Future<void> getDirections({
    required LatLng origin,
  }) async {
    final places = GoogleMapsPlaces(apiKey: "$apiKey");
    PlacesSearchResponse response = await places.searchNearbyWithRadius(
        Location(lat: origin.latitude, lng: origin.longitude), 1);
if(response.results.isNotEmpty){
  final PlacesSearchResult data = response.results.first;
  final id = data.placeId;


  PlacesDetailsResponse response2 = await places.getDetailsByPlaceId('$id');
  final PlaceDetails details = response2.result;





  // print('00000000000000000000$adress3');
  // print('00000000000000000000$types ');


}



    // final response = dio.get(_baseUrl, queryParameters: {
    //   'origin': '${origin.latitude},${origin.longitude}',
    //   apiKey: apiKey,
    // });
    //
    // print('00000000000000000000${response.hashCode}');
    // print('${origin.latitude},${origin.longitude}');
    // if (response.hashCode == 200) {
    //   print('22222222200000000000$response');
    // }
  }

  Future<CameraPosition> getLocation() async {
    Located located = Located();
    await located.getCurrentLocation();
    final CameraPosition position = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(located.latitude!, located.longitude!),
        tilt: 59.440717697143555,
        zoom: 14.0);
    return position;
  }
}
