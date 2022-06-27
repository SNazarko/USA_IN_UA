part of 'profile_edit_bloc.dart';

enum ProfileEditStatus {
  initial,
  success,
  failed,
}

@immutable
class ProfileEditState extends Equatable {
  const ProfileEditState({
    this.status = ProfileEditStatus.initial,
    this.list = const [],
  });
  final ProfileEditStatus status;
  final List list;

  ProfileEditState copyWith({
    ProfileEditStatus? status,
    List? list,
  }) {
    return ProfileEditState(
      status: status ?? this.status,
      list: list ?? this.list,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    list,
  ];
}
