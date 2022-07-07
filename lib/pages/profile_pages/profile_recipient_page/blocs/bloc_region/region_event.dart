part of 'region_bloc.dart';


@immutable
abstract class RegionEvent extends Equatable {}

class LoadRegionEvent extends RegionEvent {
  LoadRegionEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateRegionEvent extends RegionEvent {
  UpdateRegionEvent({
    this.region = const [],
  });
  final List? region;


  @override
  // TODO: implement props
  List<Object?> get props => [
    region,
  ];
}
