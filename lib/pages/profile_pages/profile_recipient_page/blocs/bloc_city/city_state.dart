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

  });
  final CityStatus status;
  final List? city;



  CityState copyWith({
    CityStatus? status,
    List? city,

  }) {
    return CityState(
      status: status ?? this.status,
      city: city ?? this.city,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    city
  ];
}
