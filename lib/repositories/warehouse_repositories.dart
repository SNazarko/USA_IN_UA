import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/warehouse_model.dart';
import 'auth_repositories.dart';

class WarehouseRepositories {
  WarehouseRepositories._() {
    _init();
  }

  static final WarehouseRepositories instance = WarehouseRepositories._();
  String? phoneNumber;

  void _init() {
    phoneNumber = AuthRepositories.instance.user?.phoneNumber!;
  }

  Stream<List<WarehouseModel>> readAudio() => FirebaseFirestore.instance
      .collection(phoneNumber!)
      .doc('address')
      .collection('warehouse')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => WarehouseModel.fromJson(doc.data())).toList());



  Future<Future<List<WarehouseModel>>> getWarehouse()async{
        var recipient = FirebaseFirestore.instance
            .collection(phoneNumber!)
            .doc('address')
            .collection('warehouse')
            .get()
            .then((res) => res.docs
            .map((doc) => WarehouseModel.fromJson(doc.data()))
            .toList());
        return recipient;
    }


}
