import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';


import '../models/region_model.dart';
import '../services/located.dart';
import 'dart:async';

// "https://maps.googleapis.com/maps/api/directions/json?"
const googleApiKey = 'AIzaSyAEg2dVWnVPjrSDScV-LqGmdUKMsWT79PU';
const newPostApiKey = 'd94535f87d363bec8c9eb5ea3e13a9dd';

class LocatedRepositories {
  LocatedRepositories._();
  static const String _baseUrl =
     'https://api.novaposhta.ua/v2.0/json/';

  static LocatedRepositories instance = LocatedRepositories._();
  final dio = Dio();
  void getHttp() async {
    try {
      var response = await dio.post(_baseUrl,
          data:
        {
          "apiKey": "d94535f87d363bec8c9eb5ea3e13a9dd",
          "modelName": "Address",
          "calledMethod": "searchSettlements",
          "methodProperties": {
            "CityName": "кривий ріг",
            "Limit": "50",
            "Page": "1"
          }
        }
      );
      print(response);
    } catch (e) {
      print(e);
    }
  }


Future<void> getCity ()async{
  String textData = await rootBundle.loadString('assets/texts/city.json');
  List<dynamic> data = json.decode(textData);
  String data2 = data[50]['region'];
  print(data2);
}

  Future<void> getDirections({
    required LatLng origin,
  }) async {
    final places = GoogleMapsPlaces(apiKey: googleApiKey);
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
  print('================$wwww');
  print('================$aaaa');
  print('----------------$adress');




}



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

