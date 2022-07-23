import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../models/add_link_goods_model.dart';
import '../../../../repositories/add_link_goods_repositories.dart';

part 'list_item_event.dart';
part 'list_item_state.dart';

class DeliveryListItemBloc extends Bloc<DeliveryListItemEvent, DeliveryListItemState> {
  DeliveryListItemBloc()
      : super(
    const DeliveryListItemState(),
  ) {
    on<LoadDeliveryListItemEvent>((
        LoadDeliveryListItemEvent event,
        Emitter<DeliveryListItemState> emit,
        ) async {
      List item = [];
      item.clear();
      try {
        Stream<List<AddLinkGoodsModel>> _goodsSubscription = AddLinkGoodsRepositories.instance.readLinkGoods(event.sort!);
        Stream<List<AddLinkGoodsModel>> _deliverySubscription = AddLinkGoodsRepositories.instance.readLinkDelivery(event.sort!);
        Stream<List<AddLinkGoodsModel>> _mergeSubscription = MergeStream([
          _deliverySubscription,
          _goodsSubscription,

        ]);
        _mergeSubscription.listen((event) {
          item.addAll(event);
          add(UpdateDeliveryListItemEvent(
            list: item,
          ));
        });

      } on Exception {
        emit(state.copyWith(
          status: DeliveryListItemStatus.failed,
        ));
      }
    });

    on<UpdateDeliveryListItemEvent>((
        UpdateDeliveryListItemEvent event,
        Emitter<DeliveryListItemState> emit,
        ) {
      emit(
        state.copyWith(
          status: DeliveryListItemStatus.success,
          list: event.list,
        ),
      );
    });
  }

  StreamSubscription? _deliverySubscription;
  StreamSubscription? _goodsSubscription;
  StreamSubscription? _mergeSubscription;

  @override
  Future<void> close() {
    _deliverySubscription?.cancel();
    _goodsSubscription?.cancel();
    _mergeSubscription?.cancel();
    return super.close();
  }

}
