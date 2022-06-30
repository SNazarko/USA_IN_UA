import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocatedModel{
    factory LocatedModel.fromJson(
      Map<String, dynamic> map,
    ) {
      // if((map['routes'] as List).isNotEmpty) {
        final data = Map<String,dynamic>.from(map['routes'][0]);
        final northeast = data['bounds']['northeast'];
        final southwest = data['bounds']['southwest'];
        final bounds = LatLngBounds(
          northeast: LatLng(northeast['lat'],northeast['lng'] ),
          southwest: LatLng(southwest['lat'],southwest['lng'] ),
        );
        return LocatedModel(
          bounds: bounds,
        );
      // }
}
  LocatedModel({
    required this.bounds,
});
  final LatLngBounds bounds;
}
