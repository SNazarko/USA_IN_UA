import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:usa_in_ua/pages/profile_pages/profile_recipient_addresses_page/blocs/bloc_data/profile_recipient_event.dart';
part 'profile_recipient_state.dart';

class ProfileRecipientBloc
    extends Bloc<ProfileRecipientEvent, ProfileRecipientState> {
  ProfileRecipientBloc()
      : super(
          const ProfileRecipientState(),
        ) {
    on<ProfileRecipientEvent>((
      event,
      emit,
    ) {
      emit(
        state.copyWith(
          region: event.region,
          city: event.city,
          street: '${event.street} ${event.houseNumber}/${event.flatNumber}',
          name: event.name,
          surname: event.surname,
          phoneNumber: event.phoneNumber,
          departmentNP: event.departmentNP,
          addressName: event.addressName,
          country: event.country,

        ),
      );
    });
  }
}
