import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../../database/local_database.dart';
import '../../../../models/user_model.dart';
import '../../../../repositories/profile_repositories.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {

  ProfileEditBloc() : super(const ProfileEditState()) {
    on<LoadProfileEditEvent>((
        LoadProfileEditEvent event,
        Emitter<ProfileEditState> emit,
        ) async {
      try {
        LocalDB.instance.initializeHive2();
        final  box = await Hive.openBox<UserModel>('profile_box');
        if(box.isNotEmpty){
          add(
          UpdateProfileEditEvent(
              list: box.values.toList()
          ),
        );} else{
          ProfileRepositories.instance.getProfile();
          LocalDB.instance.initializeHive2();
          final  box = await Hive.openBox<UserModel>('profile_box');
          add(
            UpdateProfileEditEvent(
                list: box.values.toList()
            ),
          );
          box.listenable().addListener(() {
            add(
              UpdateProfileEditEvent(
                list: box.values.toList(),
              ),
            );
          });
        }


      } on Exception {
        emit(state.copyWith(
          status: ProfileEditStatus.failed,
        ));
      }
    });

    on<UpdateProfileEditEvent>((
        UpdateProfileEditEvent event,
        Emitter<ProfileEditState> emit,
        ) {
      emit(
        state.copyWith(
          status: ProfileEditStatus.success,
          list: event.list,
        ),
      );
    });
  }



}
