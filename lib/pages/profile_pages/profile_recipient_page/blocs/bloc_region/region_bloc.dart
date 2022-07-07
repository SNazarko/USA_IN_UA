import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../repositories/located_repositories.dart';

part 'region_event.dart';
part 'region_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  RegionBloc() : super(const RegionState()) {
    on<LoadRegionEvent>((event, emit) async{
      try {
        final listRegion = await LocatedRepositories.instance.getRegion();

        add(UpdateRegionEvent(region:listRegion?.city));

      } on Exception catch (e) {
        emit(state.copyWith(
          status: RegionStatus.failed,
        ));
      }
    });
    on<UpdateRegionEvent>((
        UpdateRegionEvent event,
        Emitter<RegionState> emit,
        ) {
      emit(
        state.copyWith(
          status: RegionStatus.success,
          region: event.region,
        ),
      );
    });
  }



}
