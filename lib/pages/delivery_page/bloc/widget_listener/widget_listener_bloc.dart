import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'widget_listener_event.dart';
part 'widget_listener_state.dart';

class WidgetListenerBloc
    extends Bloc<WidgetListenerEvent, WidgetListenerState> {
  WidgetListenerBloc()
      : super(
    const WidgetListenerState(),
  ) {
    on<WidgetListenerEvent>((
        event,
        emit,
        ) async {
      emit(
        state.copyWith(
   index: event.index,


        ),
      );
    });
  }

}
