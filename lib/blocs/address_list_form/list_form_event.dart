part of 'list_form_bloc.dart';

@immutable
abstract class ListFormEvent extends Equatable {}

class LoadListFormEvent extends ListFormEvent {
   LoadListFormEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateListFormEvent extends ListFormEvent {
   UpdateListFormEvent({
    this.list = const [],
  });
  final List list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
