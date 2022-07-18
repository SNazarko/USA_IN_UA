import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/add_link_goods_model.dart';
import 'auth_repositories.dart';

class AddLinkGoodsRepositories {
  AddLinkGoodsRepositories._() {
    init();
  }

  static final AddLinkGoodsRepositories instance = AddLinkGoodsRepositories._();
  String? _phoneNumber;

  void init() {
    _phoneNumber = AuthRepositories.instance.user?.phoneNumber!;
  }
  final _uuid = const Uuid();



  Stream<List<AddLinkGoodsModel>> readLinkGoods() => FirebaseFirestore.instance
      .collection(_phoneNumber!)
      .doc('addLinkGoods')
      .collection('addLinkGoods')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => AddLinkGoodsModel.fromJson(doc.data())).toList());

  Stream<List<AddLinkGoodsModel>> readLinkDelivery() => FirebaseFirestore.instance
      .collection(_phoneNumber!)
      .doc('addLinkGoods')
      .collection('addLinkDelivery')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => AddLinkGoodsModel.fromJson(doc.data())).toList());



  Future<void> addLinkDelivery(
      String price,
      String weight,
      String details,
      String track,
      bool isSwish,
      String image,

      ) async {
    var id = _uuid.v1();
    final data = AddLinkGoodsModel(
      id: id,
      track: track,
      price: price,
      weight: weight,
      details: details,
      isSwish: isSwish,
      image: image,
    );
    final json = data.toJson();
    FirebaseFirestore.instance
        .collection(_phoneNumber!)
        .doc('addLinkGoods')
        .collection('addLinkDelivery')
        .doc(id)
        .set(json);

  }
  Future<void> deleteLinkDelivery(
      String id,
      ) async {
    FirebaseFirestore.instance
        .collection(_phoneNumber!)
        .doc('addLinkGoods')
        .collection('addLinkDelivery')
        .doc(id)
        .delete();
  }

  Future<void> addLinkGoods(
      String link,
      String quality,
      String price,
      String weight,
      String additionalServices,
      String details,
      bool isSwish,

      ) async {
    var id = _uuid.v1();
    final data = AddLinkGoodsModel(
      id: id,
      link: link,
      quality: quality,
      price: price,
      weight: weight,
      additionalServices: additionalServices,
      details: details,
      isSwish: isSwish,
    );
    final json = data.toJson();
    FirebaseFirestore.instance
        .collection(_phoneNumber!)
        .doc('addLinkGoods')
        .collection('addLinkGoods')
        .doc(id)
        .set(json);

  }
  Future<void> deleteLinkGoods(
      String id,
      ) async {
    FirebaseFirestore.instance
        .collection(_phoneNumber!)
        .doc('addLinkGoods')
        .collection('addLinkGoods')
        .doc(id)
        .delete();
  }
  //
  // Future<void> doneAddress(
  //     String addressName, bool done,) async {
  //   FirebaseFirestore.instance
  //       .collection(phoneNumber!)
  //       .doc('recipient')
  //       .collection('recipient')
  //       .doc(addressName)
  //       .update({'userCard': done});
  //
  //
  // }

}
