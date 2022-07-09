part of 'bloc_warehouse_bloc.dart';

@immutable
abstract class WarehouseEvent extends Equatable {}
class LoadLWarehouseEvent extends WarehouseEvent {
  LoadLWarehouseEvent();


  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateWarehouseEvent extends WarehouseEvent {
  UpdateWarehouseEvent({
    this.list = const [],
  });
  final List list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}