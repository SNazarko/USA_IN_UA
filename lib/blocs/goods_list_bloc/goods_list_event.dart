import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ListItemEvent extends Equatable {}

class LoadListItemEvent extends ListItemEvent {
  LoadListItemEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UpdateListItemEvent extends ListItemEvent {
  UpdateListItemEvent({
    this.list = const [],
  });
  final List list;

  @override
  // TODO: implement props
  List<Object?> get props => [list];
}
