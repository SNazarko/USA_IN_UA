part of 'bloc_street_bloc.dart';

enum StreetStatus {
  initial,
  success,
  failed,
}

@immutable
class StreetState extends Equatable {
  const StreetState({
    this.status = StreetStatus.initial,
    this.street = const [],

  });
  final StreetStatus status;
  final List? street;



  StreetState copyWith({
    StreetStatus? status,
    List? street,

  }) {
    return StreetState(
      status: status ?? this.status,
      street: street ?? this.street,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    street,
  ];
}