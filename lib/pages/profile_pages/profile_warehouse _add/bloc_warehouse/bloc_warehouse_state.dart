part of 'bloc_warehouse_bloc.dart';

enum WarehouseStatus {
  initial,
  success,
  failed,
}

@immutable
class WarehouseState extends Equatable {
  const WarehouseState({
    this.status = WarehouseStatus.initial,
    this.list = const [],
  });
  final WarehouseStatus status;
  final List list;

  WarehouseState copyWith({
    WarehouseStatus? status,
    List? list,
  }) {
    return WarehouseState(
      status: status ?? this.status,
      list: list ?? this.list,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    list,
  ];
}