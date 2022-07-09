class WarehouseModel {
  WarehouseModel({

    this.city,
    this.index,
    this.name,
    this.phoneNumber,
    this.state,
    this.street,
    this.warehouseTitle,
  });

  factory WarehouseModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return WarehouseModel(

      city: json['city'],
      index: json['index'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      state: json['state'],
      street: json['street'],
      warehouseTitle: json['warehouseTitle'],
    );
  }

  String? city;
  String? index;
  String? name;
  String? phoneNumber;
  String? state;
  String? street;
  String? warehouseTitle;

  Map<String, dynamic> toJson() => {

    'city': city,
    'index': index,
    'name': name,
    'phoneNumber': phoneNumber,
    'state': state,
    'street': street,
    'warehouseTitle': warehouseTitle
  };
}
