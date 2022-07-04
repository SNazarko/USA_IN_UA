class RegionModel {
  RegionModel({
    this.region,
    this.city,

  });

  factory RegionModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return RegionModel(
      region: json['region'],
      city: json['object_name'],

    );
  }
  String? region;
  String? city;


  Map<String, dynamic> toJson() => {
    'region': region,
    'object_name': city
  };
}
