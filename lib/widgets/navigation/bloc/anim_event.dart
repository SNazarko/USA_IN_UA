part of 'anim_bloc.dart';

@immutable
class AnimEvent extends Equatable {
  const AnimEvent({
    required this.anim,
  });
  final double anim;

  @override
  // TODO: implement props
  List<Object?> get props => [anim];
}
