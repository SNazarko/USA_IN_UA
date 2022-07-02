
import 'package:equatable/equatable.dart';

class ProfileRecipientEvent extends Equatable {
  const ProfileRecipientEvent({
    this.region,
    this.city,
    this.street,
    this.name,
    this.surname,
    this.phoneNumber,
    this.departmentNP,
    this.addressName,
    this.country,
    this.houseNumber,
    this.flatNumber,

  });
  final String? region;
  final String? city;
  final String? street;
  final String? name;
  final String? surname;
  final String? phoneNumber;
  final String? departmentNP;
  final String? addressName;
  final String? country;
  final String? houseNumber;
  final String? flatNumber;


  @override
  // TODO: implement props
  List<Object?> get props => [
    region,
    city,
    street,
    name,
    surname,
    phoneNumber,
    departmentNP,
    addressName,
    country,
    houseNumber,
    flatNumber,
  ];
}