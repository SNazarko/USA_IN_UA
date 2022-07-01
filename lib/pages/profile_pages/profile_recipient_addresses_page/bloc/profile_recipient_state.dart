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

  });
  final String? region;
  final String? city;
  final String? street;
  final String? name;
  final String? surname;
  final String? phoneNumber;
  final String? departmentNP;


  ProfileRecipientState copyWith({
    String? region,
    String? city,
    String? street,
    String? name,
    String? surname,
    String? phoneNumber,
    String? departmentNP,

  }) {
    return ProfileRecipientState(
      region: region ?? this.region,
      city: city ?? this.city,
      street: street ?? this.street,
      name: name ?? this.name,
      surname: surname?? this.surname,
      phoneNumber: phoneNumber?? this.phoneNumber,
      departmentNP: departmentNP?? this.departmentNP,

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

  ];
}