import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum ListItemStatus {
  initial,
  success,
  failed,
}

@immutable
class ListItemState extends Equatable {
  const ListItemState({
    this.status = ListItemStatus.initial,
    this.list = const [],
  });
  final ListItemStatus status;
  final List list;

  ListItemState copyWith({
    ListItemStatus? status,
    List? list,
  }) {
    return ListItemState(
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
