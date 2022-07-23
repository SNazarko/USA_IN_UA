part of 'list_item_bloc.dart';

@immutable
abstract class DeliveryListItemEvent extends Equatable {}

class LoadDeliveryListItemEvent extends DeliveryListItemEvent {
  LoadDeliveryListItemEvent({
    this.sort,
  });
  final String? sort;

  @override
  // TODO: implement props
  List<Object?> get props => [sort];
}

class UpdateDeliveryListItemEvent extends DeliveryListItemEvent {
  UpdateDeliveryListItemEvent({
    this.list = const [],
  });
  final List list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
