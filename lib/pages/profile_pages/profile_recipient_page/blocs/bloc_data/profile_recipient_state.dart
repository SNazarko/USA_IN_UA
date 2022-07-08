part of 'profile_recipient_bloc.dart';


@immutable
class ProfileRecipientState extends Equatable {
  const ProfileRecipientState({
    this.region,
    this.city,
    this.street,
    this.name,
    this.surname,
    this.phoneNumber,
    this.departmentNP,
    this.addressName,
    this.country,
    this.flatNumber,
    this.houseNumber,




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
 final String? flatNumber;
  final String? houseNumber;





  ProfileRecipientState copyWith({
    String? region,
    String? city,
    String? street,
    String? name,
    String? surname,
    String? phoneNumber,
    String? departmentNP,
    String? addressName,
    String? country,
    String? flatNumber,
    String? houseNumber,



  }) {
    return ProfileRecipientState(
      region: region ?? this.region,
      city: city ?? this.city,
      street: street ?? this.street,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      departmentNP: departmentNP ?? this.departmentNP,
      addressName: addressName ?? this.addressName,
      country: country ?? this.country,
      flatNumber: flatNumber ?? this.flatNumber,
      houseNumber: houseNumber ?? this.houseNumber,



    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    region,
    city,
    street,
    name,
    surname,
    phoneNumber,
    addressName,
    country,
    departmentNP,
    flatNumber,
    houseNumber,
  ];
}