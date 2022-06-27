part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();
}
@immutable
abstract class ListItemEvent extends Equatable {}

class LoadProfileEditEvent extends ProfileEditEvent {
  const LoadProfileEditEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateProfileEditEvent extends ProfileEditEvent {
  const UpdateProfileEditEvent({
    this.list = const [],
  });
  final List list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
