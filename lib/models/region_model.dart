class RegionModel {
  RegionModel({
    this.ref,
    this.city,

  });

  // factory RegionModel.fromJson(
  //     Map<String, dynamic> json,
  //     ) {
  //   return RegionModel(
  //     region: json['region'],
  //     city: json['object_name'],
  //
  //   );
  // }
  List? ref;
  List? city;

  //
  // Map<String, dynamic> toJson() => {
  //   'region': region,
  //   'object_name': city
  // };
}
