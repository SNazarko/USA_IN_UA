import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class ListItemEvent extends Equatable {}

class LoadListItemEvent extends ListItemEvent {
  LoadListItemEvent({
    this.sort,
  });
  final String? sort;

  @override
  // TODO: implement props
  List<Object?> get props => [sort];
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
