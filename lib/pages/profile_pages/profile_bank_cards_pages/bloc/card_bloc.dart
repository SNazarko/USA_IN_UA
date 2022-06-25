import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../database/local_database.dart';
import '../../../../models/card_model.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {

  CardBloc() : super(const CardState()) {
    on<LoadCardItemEvent>((event, emit) async{
        try {
          LocalDB.instance.initializeHive();
          final  box = await Hive.openBox<CardModel>('card_box');
          add(
            UpdateCardItemEvent(
              list: box.values.toList(),
            ),
          );
          box.listenable().addListener(() {
            add(
              UpdateCardItemEvent(
                list: box.values.toList(),
              ),
            );
          });


        } on Exception catch (e) {
          emit(state.copyWith(
            status: CardStatus.failed,
          ));
        }
    });
    on<UpdateCardItemEvent>((
        UpdateCardItemEvent event,
        Emitter<CardState> emit,
        ) {
      emit(
        state.copyWith(
          status: CardStatus.success,
          list: event.list,
        ),
      );
    });
  }
}
