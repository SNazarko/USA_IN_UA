part of 'list_event_bloc.dart';

@immutable
abstract class ListEventEvent extends Equatable {}

class LoadListEventEvent extends ListEventEvent {
  LoadListEventEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
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
