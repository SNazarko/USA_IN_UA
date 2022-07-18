part of 'list_event_bloc.dart';

@immutable
abstract class ListEventEvent extends Equatable {}

class LoadListEventEvent extends ListEventEvent {
  LoadListEventEvent({
    required this.order,
});

  final bool order;
  @override
  // TODO: implement props
  List<Object?> get props => [
    order
  ];
}

class UpdateListEventEvent extends ListEventEvent {
  UpdateListEventEvent({
    this.list = const [],
  });
  final List list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
