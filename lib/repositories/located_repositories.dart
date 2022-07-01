
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';


import '../services/located.dart';
import 'dart:async';

// "https://maps.googleapis.com/maps/api/directions/json?"
const googleApiKey = 'AIzaSyAEg2dVWnVPjrSDScV-LqGmdUKMsWT79PU';
const newPostApiKey = 'da6ddc24259b34b6f5082168bcf5da8f';

class LocatedRepositories {
  LocatedRepositories._();
  static const String _baseUrl =
      "https://api.novaposhta.ua/v2.0/json=/Address/getCities";

  static LocatedRepositories instance = LocatedRepositories._();
  final dio = Dio();
  void getHttp() async {
    try {
      var response = await dio.get(_baseUrl,
        queryParameters:
        {
          "apiKey": newPostApiKey,
          "modelName": "Address",
          "calledMethod": "getSettlements",
          "methodProperties": {}
        }



      );
      print(response);
    } catch (e) {
      print(e);
    }
  }




  Future<void> getDirections({
    required LatLng origin,
  }) async {
    final places = GoogleMapsPlaces(apiKey: "");
    PlacesSearchResponse response = await places.searchNearbyWithRadius(
        Location(lat: origin.latitude, lng: origin.longitude), 1);
if(response.results.isNotEmpty){
  final PlacesSearchResult data = response.results.first;
  final id = data.placeId;
  PlacesDetailsResponse response2 = await places.getDetailsByPlaceId('$id');
  final PlaceDetails details = response2.result;
  final adress = details.formattedAddress;
  final List<AddressComponent> adress1 = details.addressComponents;
  final AddressComponent adress2 = adress1[0];
  final AddressComponent adress3 = adress1[1];

  final wwww =  adress2.longName;
  final aaaa =  adress3.longName;
  // final qqqq =  adress4.longName;
  // final eeee =  adress5.longName;








  print('00000000000000000000$wwww');
  print('00000000000000000000$aaaa ');
  // print('00000000000000000000$qqqq ');
  // print('00000000000000000000$eeee ');





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
