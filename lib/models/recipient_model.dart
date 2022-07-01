class RecipientModel {
  RecipientModel({
    this.region,
    this.city,
    this.street,
    this.name,
    this.surname,
    this.phoneNumber,
    this.departmentNP,
  });

  factory RecipientModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return GoodsModel(
      region: json['region'],
      city: json['city'],
      street: json['street'],
      name: json['name'],
      surname: json['surname'],
      phoneNumber: json['phoneNumber'],
      departmentNP: json['departmentNP'],
    );
  }
  String? region;
  String? city;
  String? street;
  String? name;
  String? surname;
  String? phoneNumber;
  String? departmentNP;

  Map<String, dynamic> toJson() => {
        'region': region,
        'city': city,
        'street': street,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'departmentNP': departmentNP
      };
}
