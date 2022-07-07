part of 'new_post_bloc.dart';

@immutable
abstract class NewPostEvent extends Equatable {}

class LoadNewPostEvent extends NewPostEvent {
  LoadNewPostEvent({this.department,});
  final String? department;
  @override
  // TODO: implement props
  List<Object?> get props => [
    department,
  ];
}

class UpdateNewPostEvent extends NewPostEvent {
  UpdateNewPostEvent({
    this.department,
  });
  final List? department;


  @override
  // TODO: implement props
  List<Object?> get props => [
    department,
  ];
}
