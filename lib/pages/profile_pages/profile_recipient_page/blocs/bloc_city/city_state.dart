part of 'city_bloc.dart';

enum CityStatus {
  initial,
  success,
  failed,
}

@immutable
class CityState extends Equatable {
  const CityState({
    this.status = CityStatus.initial,
    this.city = const [],
    this.ref = const [],

  });
  final CityStatus status;
  final List? city;
  final List? ref;


  CityState copyWith({
    CityStatus? status,
    List? city,
    List? ref,

  }) {
    return CityState(
      status: status ?? this.status,
      city: city ?? this.city,
      ref: ref ?? this.ref,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    city,
    ref,
  ];
}
