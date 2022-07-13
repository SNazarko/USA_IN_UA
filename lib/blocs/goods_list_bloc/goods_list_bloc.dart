import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../repositories/goods_repositories.dart';
import 'goods_list_event.dart';
import 'goods_list_state.dart';

class ListItemBloc extends Bloc<ListItemEvent, ListItemState> {
  ListItemBloc()
      : super(
          const ListItemState(),
        ) {
    on<LoadListItemEvent>((
      LoadListItemEvent event,
      Emitter<ListItemState> emit,
    ) async {
      try {
        final list = await GoodsRepositories.instance.getGoods(event.sort!);
        list.then((value) => {
          add(UpdateListItemEvent(list: value))
        });
      } on Exception {
        emit(state.copyWith(
          status: ListItemStatus.failed,
        ));
      }
    });

    on<UpdateListItemEvent>((
      UpdateListItemEvent event,
      Emitter<ListItemState> emit,
    ) {
      emit(
        state.copyWith(
          status: ListItemStatus.success,
          list: event.list,
        ),
      );
    });
  }

}
