
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/card_model.dart';
import '../models/user_model.dart';

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

  Future<void> initializeHive2() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(UserModelAdapter());
    }
  }


  Future<void> add2 (model) async {
    initializeHive2();
    final box = await Hive.openBox<UserModel>('profile_box');
    await box.add(model);
  }
}
