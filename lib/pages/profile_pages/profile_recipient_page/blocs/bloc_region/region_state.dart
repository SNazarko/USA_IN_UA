part of 'region_bloc.dart';

enum RegionStatus {
  initial,
  success,
  failed,
}

@immutable
class RegionState extends Equatable {
  const RegionState({
    this.status = RegionStatus.initial,
    this.region = const [],

  });
  final RegionStatus status;
  final List? region;



  RegionState copyWith({
    RegionStatus? status,
    List? region,

  }) {
    return RegionState(
      status: status ?? this.status,
      region: region ?? this.region,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
  region
  ];
}