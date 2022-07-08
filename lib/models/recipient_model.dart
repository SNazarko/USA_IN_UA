class RecipientModel {
  RecipientModel({
    this.region,
    this.city,
    this.street,
    this.name,
    this.surname,
    this.phoneNumber,
    this.departmentNP,
    this.isCard,
    this.userCard,
    this.addressName,
    this.flatNumber,
    this.houseNumber,
    this.country,
  });

  factory RecipientModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return RecipientModel(
      region: json['region'],
      city: json['city'],
      street: json['street'],
      name: json['name'],
      surname: json['surname'],
      phoneNumber: json['phoneNumber'],
      departmentNP: json['departmentNP'],
      isCard: json['isCard'],
      userCard: json['userCard'],
      addressName: json['addressName'],
      flatNumber: json['flatNumber'],
      houseNumber: json['houseNumber'],
      country: json['country'],
    );
  }
  String? region;
  String? city;
  String? street;
  String? name;
  String? surname;
  String? phoneNumber;
  String? departmentNP;
  String? addressName;
  String? flatNumber;
  String? houseNumber;
  String? country;

  bool? isCard;
  bool? userCard;


  Map<String, dynamic> toJson() => {
        'region': region,
        'city': city,
        'street': street,
        'name': name,
        'surname': surname,
        'phoneNumber': phoneNumber,
        'departmentNP': departmentNP,
        'isCard': isCard,
        'addressName': addressName,
        'userCard': userCard,
        'flatNumber': flatNumber,
        'houseNumber': houseNumber,
        'country': country
      };
}
