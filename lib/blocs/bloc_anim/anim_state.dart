part of 'anim_bloc.dart';

@immutable
class AnimState extends Equatable {
  const AnimState({
    this.anim = 0.0,
  });
  final double anim;

  AnimState copyWith({
    double? anim,
  }) {
    return AnimState(
      anim: anim ?? this.anim,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [anim];
}
