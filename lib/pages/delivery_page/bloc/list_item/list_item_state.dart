part of 'list_item_bloc.dart';

enum DeliveryListItemStatus {
  initial,
  success,
  failed,
}

@immutable
class DeliveryListItemState extends Equatable {
  const DeliveryListItemState({
    this.status = DeliveryListItemStatus.initial,
    this.list = const [],
  });
  final DeliveryListItemStatus status;
  final List list;

  DeliveryListItemState copyWith({
    DeliveryListItemStatus? status,
    List? list,
  }) {
    return DeliveryListItemState(
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
