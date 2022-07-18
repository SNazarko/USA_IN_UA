part of 'list_event_bloc.dart';


enum ListEventStatus {
  initial,
  success,
  failed,
}

@immutable
class ListEventState extends Equatable {
  const ListEventState({
    this.status = ListEventStatus.initial,
    this.list = const [],
  });
  final ListEventStatus status;
  final List list;

  ListEventState copyWith({
    ListEventStatus? status,
    List? list,
  }) {
    return ListEventState(
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