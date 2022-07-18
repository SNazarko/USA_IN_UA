import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../repositories/add_link_goods_repositories.dart';



part 'list_event_event.dart';
part 'list_event_state.dart';

class ListEventBloc extends Bloc<ListEventEvent, ListEventState> {

  ListEventBloc() : super(const ListEventState()) {
    on<LoadListEventEvent>((event, emit) async{
      try {
        _audioSubscription?.cancel();
        if(event.order){
          _audioSubscription = AddLinkGoodsRepositories.instance
              .readLinkGoods()
              .listen((list) {
            add(
              UpdateListEventEvent(
                list: list,
              ),
            );
          });
        }else{
          _audioSubscription = AddLinkGoodsRepositories.instance
              .readLinkDelivery()
              .listen((list) {
            add(
              UpdateListEventEvent(
                list: list,
              ),
            );
          });
        }

      } on Exception catch (e) {
        emit(state.copyWith(
          status: ListEventStatus.failed,
        ));
      }
    });
    on<UpdateListEventEvent>((
        UpdateListEventEvent event,
        Emitter<ListEventState> emit,
        ) {
      emit(
        state.copyWith(
          status: ListEventStatus.success,
          list: event.list,
        ),
      );
    });
  }
  StreamSubscription? _audioSubscription;

  @override
  Future<void> close() {
    _audioSubscription?.cancel();
    return super.close();
  }
}
