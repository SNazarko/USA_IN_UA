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



  Stream<List<AddLinkGoodsModel>> readLinkGoods(String sort) => FirebaseFirestore.instance
      .collection(_phoneNumber!)
      .doc('addLinkGoods')
      .collection('addLinkGoods')
      .where('statusItem', arrayContains: sort)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => AddLinkGoodsModel.fromJson(doc.data())).toList());

  Stream<List<AddLinkGoodsModel>> readLinkDelivery(String sort) => FirebaseFirestore.instance
      .collection(_phoneNumber!)
      .doc('addLinkGoods')
      .collection('addLinkDelivery')
      .where('statusItem', arrayContains: sort)
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
      imageGoods: 'https://u.makeup.com.ua/m/mr/mrvq1yzqb8e9.png',
      id: id,
      track: track,
      price: price,
      weight: weight,
      details: details,
      isSwish: isSwish,
      image: image,
      quality: '1',
      status: 'Расчет стоимости заявки',
      statusItem: ['all'],
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

    String _quality(String quality){
      if(quality == '' || quality == null) return '1';
      return quality;
    }
    var id = _uuid.v1();
    final data = AddLinkGoodsModel(
      imageGoods: 'https://u.makeup.com.ua/m/mr/mrvq1yzqb8e9.png',
      id: id,
      link: link,
      quality: _quality(quality),
      price: price,
      weight: weight,
      additionalServices: additionalServices,
      details: details,
      isSwish: isSwish,
      status: 'Готов к оплате',
        statusItem: ['all'],
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


}
