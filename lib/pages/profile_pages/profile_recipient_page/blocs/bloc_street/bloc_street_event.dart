part of 'bloc_street_bloc.dart';

@immutable
abstract class StreetEvent extends Equatable {}

class LoadStreetEvent extends StreetEvent {
  LoadStreetEvent({
    this.city,
    this.listCity,
    this.listRef,
  });

  final String? city;
  final List? listCity;
  final List? listRef;

  @override
  // TODO: implement props
  List<Object?> get props => [
    city,
    listCity,
    listRef,
  ];
}




class UpdateStreetEvent extends StreetEvent {
  UpdateStreetEvent({

    this.street = const [],

  });

  final List? street;


  @override
  // TODO: implement props
  List<Object?> get props => [
    street,
  ];
}