import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../models/warehouse_model.dart';
import '../../../../repositories/warehouse_repositories.dart';

part 'bloc_warehouse_event.dart';
part 'bloc_warehouse_state.dart';

class WarehouseBloc extends Bloc<WarehouseEvent, WarehouseState> {
  WarehouseBloc()
      : super(
    const WarehouseState(),
  ) {
    on<LoadLWarehouseEvent>((
        LoadLWarehouseEvent event,
        Emitter<WarehouseState> emit,
        ) async{
      try {
        final list = await WarehouseRepositories.instance.getWarehouse();
        list.then((value) => {
          add(UpdateWarehouseEvent(list: value))
        });

      } on Exception {
        emit(state.copyWith(
          status: WarehouseStatus.failed,
        ));
      }
    });

    on<UpdateWarehouseEvent>((
        UpdateWarehouseEvent event,
        Emitter<WarehouseState> emit,
        ) {
      emit(
        state.copyWith(
          status: WarehouseStatus.success,
          list: event.list,
        ),
      );
    });
  }
  // StreamSubscription? _audioSubscription;
  //
  // @override
  // Future<void> close() {
  //   _audioSubscription?.cancel();
  //   return super.close();
  // }
}
