part of 'widget_listener_bloc.dart';

@immutable
class WidgetListenerState extends Equatable {
  const WidgetListenerState({
    this.index = 1,
  });

  final int index;


  WidgetListenerState copyWith({
    int? index,
  }) {
    return WidgetListenerState(
      index: index ?? this.index,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        index,
      ];
}