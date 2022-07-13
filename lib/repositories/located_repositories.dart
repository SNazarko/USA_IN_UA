import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:usa_in_ua/models/region_model.dart';
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
  Future<List?> getAddressNP(
      String city
      ) async {
    try {
      var response = await dio.post(_baseUrl,
          data:
          {
            "apiKey": "$newPostApiKey",
            "modelName": "Address",
            "calledMethod": "getWarehouses",
            "methodProperties": {
              "CityName" : city,
              "Language" : 'ru',
              "TypeOfWarehouse" : "6f8c7162-4b72-4b0a-88e5-906948c6a92f",

            }
          }
      );
      var data = response.data;
      bool success = data['success'];
      if(success == true){
        List addressList = data['data'] as List;
        List addressNP = addressList.map((addressJson) => addressJson['ShortAddressRu']).toList();
return addressNP;
      }

    } catch (e) {
      print(e);
    }
  }

  Future<RegionModel?> getRegion() async {
    try {
      var response = await dio.post(_baseUrl,
          data:
          {
            "apiKey": "$newPostApiKey",
          "modelName": "Address",
          "calledMethod": "getAreas",
          "methodProperties": {   }
          }
      );
      var data = response.data;
      bool success = data['success'];
      if(success == true){
        List addressList = data['data'] as List;
        List cityNP = addressList.map((addressJson) => addressJson['DescriptionRu']).toList();
        List cityRef = addressList.map((addressJson) => addressJson['Ref']).toList();
        final RegionModel address = RegionModel(city: cityNP,ref: cityRef, );
        return address;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<RegionModel?> getCity(
      String region
      ) async {
    try {
      var response = await dio.post(_baseUrl,
          data:
          {
            "apiKey": "$newPostApiKey",
          "modelName": "Address",
          "calledMethod": "getCities",
          "methodProperties": {
          "AreaRef" : region,
          }
          }
      );

      var data = response.data;
      bool success = data['success'];
      if(success == true) {
        List addressList = data['data'] as List;
        List city = addressList.map((
            addressJson) => addressJson["DescriptionRu"]).toList();
        List cityRef = addressList.map((addressJson) => addressJson['Ref'])
            .toList();
        final RegionModel address = RegionModel(city: city, ref: cityRef,);
        return address;
      }

    } catch (e) {
      print(e);
    }
  }

  Future<List?> getStreet(
      String city,
      String ref,
      ) async {
    try {
      var response = await dio.post(_baseUrl,
          data:
          {
          "apiKey": "$newPostApiKey",
          "modelName": "Address",
          "calledMethod": "getStreet",
          "methodProperties": {
          "CityRef" : ref,
          "FindByString" : city,
            "Page" : "1",
            "Limit" : ""

          }
          }
      );
        var data = response.data;
        bool success = data['success'];
        if(success == true){
          var addressList = data['data'] as List;
          List street = addressList.map((addressJson) => addressJson["Description"]).toList();
          return street;

        }

    } catch (e) {
      print(e);
    }
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

