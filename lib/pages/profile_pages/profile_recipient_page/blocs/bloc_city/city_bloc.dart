import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../repositories/located_repositories.dart';

part 'city_event.dart';
part 'city_state.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(const CityState()) {
    on<LoadCityEvent>((event, emit) async{
      try {
        final listRegion = await LocatedRepositories.instance.getRegion();
        final int? index = listRegion?.city?.indexOf(event.city);
        final getRef = listRegion?.ref![index ?? 0];
        final city = await LocatedRepositories.instance.getCity(getRef);
        add(UpdateCityEvent(city:city?.city,ref: city?.ref));

      } on Exception catch (e) {
        emit(state.copyWith(
          status: CityStatus.failed,
        ));
      }
    });
    on<UpdateCityEvent>((
        UpdateCityEvent event,
        Emitter<CityState> emit,
        ) {
      emit(
        state.copyWith(
          status: CityStatus.success,
          city: event.city,
          ref: event.ref,
        ),
      );
    });
  }



}
