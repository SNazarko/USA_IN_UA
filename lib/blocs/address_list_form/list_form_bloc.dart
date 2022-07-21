import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../models/recipient_model.dart';
import '../../../../../repositories/recipient_repositories.dart';

part 'list_form_event.dart';
part 'list_form_state.dart';

class ListFormBloc extends Bloc<ListFormEvent, ListFormState> {

  ListFormBloc() : super(const ListFormState()) {
    on<LoadListFormEvent>((event, emit) async{
      try {
        _audioSubscription?.cancel();
        _audioSubscription = RecipientRepositories.instance
            .read()
            .listen((list) {
          add(
            UpdateListFormEvent(
              list: list,
            ),
          );
        });
      } on Exception catch (e) {
        emit(state.copyWith(
          status: ListFormStatus.failed,
        ));
      }
    });
    on<UpdateListFormEvent>((
        UpdateListFormEvent event,
        Emitter<ListFormState> emit,
        ) {
      if(event.list.isEmpty){
        emit(
          state.copyWith(
            status: ListFormStatus.empty,
          ),
        );
      }else{
        emit(
          state.copyWith(
            status: ListFormStatus.success,
            list: event.list,
          ),
        );
      }
    });
  }
  StreamSubscription? _audioSubscription;

  @override
  Future<void> close() {
    _audioSubscription?.cancel();
    return super.close();
  }
}
