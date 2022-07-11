part of 'city_bloc.dart';

@immutable
abstract class CityEvent extends Equatable {}

class LoadCityEvent extends CityEvent {
  LoadCityEvent({

    this.city,

  });
  final String? city;
  @override
  // TODO: implement props
  List<Object?> get props => [
    city
  ];
}

class UpdateCityEvent extends CityEvent {
  UpdateCityEvent({

    this.city = const [],

  });

  final List? city;


  @override
  // TODO: implement props
  List<Object?> get props => [
    city
  ];
}