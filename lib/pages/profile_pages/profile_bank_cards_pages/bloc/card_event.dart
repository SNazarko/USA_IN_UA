part of 'card_bloc.dart';


@immutable
abstract class CardEvent extends Equatable {}

class LoadCardItemEvent extends CardEvent {
  LoadCardItemEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateCardItemEvent extends CardEvent {
  UpdateCardItemEvent({
    this.list = const [],
  });
  final List list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
