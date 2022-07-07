import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../repositories/located_repositories.dart';

part 'new_post_event.dart';
part 'new_post_state.dart';

class NewPostBloc extends Bloc<NewPostEvent, NewPostState> {
  NewPostBloc() : super(const NewPostState()) {
    on<LoadNewPostEvent>((event, emit) async{
      try {

        final listRegion = await LocatedRepositories.instance.getAddressNP(event.department!);

        add(UpdateNewPostEvent(department:listRegion));

      } on Exception catch (e) {
        emit(state.copyWith(
          status: NewPostStatus.failed,
        ));
      }
    });
    on<UpdateNewPostEvent>((
        UpdateNewPostEvent event,
        Emitter<NewPostState> emit,
        ) {
      emit(
        state.copyWith(
          status: NewPostStatus.success,
          department: event.department,
        ),
      );
    });
  }



}