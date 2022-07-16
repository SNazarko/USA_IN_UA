import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'data_event.dart';
part 'data_state.dart';


class OrderDataBloc
    extends Bloc<OrderDataEvent, OrderDataState> {
  OrderDataBloc()
      : super(
    const OrderDataState(),
  ) {
    on<OrderDataEvent>((
        event,
        emit,
        ) async {
      emit(
        state.copyWith(
        price: event.price,
          additionalServices: event.additionalServices,
          link: event.link,


        ),
      );
    });
  }

}
