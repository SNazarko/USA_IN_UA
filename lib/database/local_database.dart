
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/card_model.dart';

class LocalDB {
  const LocalDB._();

  static const String _authBox = 'authBox';
  static const LocalDB instance = LocalDB._();

  Future<void> initializeHive() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(CardModelAdapter());
    }
  }


  Future<void> add (CardModel card) async {
    initializeHive();
    final box = await Hive.openBox<CardModel>('card_box');
    await box.add(card);
  }

  Future<void> update (int index, CardModel card) async {
    initializeHive();
    final box = await Hive.openBox<CardModel>('card_box');
    await box.putAt(index, card);

  }

  Future<void> delete(int index) async {
    initializeHive();
    final box = await Hive.openBox<CardModel>('card_box');
   await box.deleteAt(index);
  }

}
