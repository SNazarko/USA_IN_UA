part of 'new_post_bloc.dart';

enum NewPostStatus {
  initial,
  success,
  failed,
}

@immutable
class NewPostState extends Equatable {
  const NewPostState({
    this.status = NewPostStatus.initial,
    this.department = const [],

  });
  final NewPostStatus status;
  final List? department;



  NewPostState copyWith({
    NewPostStatus? status,
    List? department,

  }) {
    return NewPostState(
      status: status ?? this.status,
      department: department ?? this.department,

    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    department
  ];
}