import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/goods_model.dart';
import 'auth_repositories.dart';

class GoodsRepositories {
  GoodsRepositories._() {
    init();
  }

  static final GoodsRepositories instance = GoodsRepositories._();
  String? phoneNumber;

  void init() {
    phoneNumber = AuthRepositories.instance.user?.phoneNumber!;
  }

  Stream<List<GoodsModel>> readAudio(String sort) => FirebaseFirestore.instance
      .collection('goods')
      .where('category', arrayContains: sort)
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => GoodsModel.fromJson(doc.data())).toList());
}
