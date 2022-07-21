part of 'list_form_bloc.dart';
enum ListFormStatus {
  initial,
  success,
  failed,
  empty
}

@immutable
class ListFormState extends Equatable {
  const ListFormState({
    this.status = ListFormStatus.initial,
    this.list = const [],
  });
  final ListFormStatus status;
  final List list;

  ListFormState copyWith({
    ListFormStatus? status,
    List? list,
  }) {
    return ListFormState(
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
