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
    ) {
      try {
        _audioSubscription?.cancel();
        _audioSubscription = GoodsRepositories.instance
            .readAudio(
          event.sort ?? 'topGoods',
        )
            .listen((audioList) {
          add(
            UpdateListItemEvent(
              list: audioList,
            ),
          );
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
  StreamSubscription? _audioSubscription;

  @override
  Future<void> close() {
    _audioSubscription?.cancel();
    return super.close();
  }
}
