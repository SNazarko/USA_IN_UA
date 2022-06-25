part of 'card_bloc.dart';

enum CardStatus {
  initial,
  success,
  failed,
}

@immutable
class CardState extends Equatable {
  const CardState({
    this.status = CardStatus.initial,
    this.list = const [],
  });
  final CardStatus status;
  final List list;

  CardState copyWith({
    CardStatus? status,
    List? list,
  }) {
    return CardState(
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
