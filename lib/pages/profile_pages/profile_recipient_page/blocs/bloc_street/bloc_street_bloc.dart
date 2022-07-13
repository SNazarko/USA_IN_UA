import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../repositories/located_repositories.dart';

part 'bloc_street_event.dart';
part 'bloc_street_state.dart';

class StreetBloc extends Bloc<StreetEvent,StreetState> {
  StreetBloc() : super(const StreetState()) {
    on<LoadStreetEvent>((event, emit) async{
      try {
        final List ref = event.listRef!;
        final List city =event.listCity!;
        final int index = city.indexOf(event.city);
        final String getRef = ref[index];
        final street = await LocatedRepositories.instance.getStreet(event.city!, getRef);

        add(UpdateStreetEvent(street:street));

      } on Exception catch (e) {
        emit(state.copyWith(
          status: StreetStatus.failed,
        ));
      }
    });
    on<UpdateStreetEvent>((
        UpdateStreetEvent event,
        Emitter<StreetState> emit,
        ) {
      emit(
        state.copyWith(
          status: StreetStatus.success,
          street: event.street,
        ),
      );
    });
  }



}
