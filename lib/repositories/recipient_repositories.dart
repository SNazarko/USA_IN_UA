import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:usa_in_ua/models/recipient_model.dart';

import 'auth_repositories.dart';

class RecipientRepositories {
  RecipientRepositories._() {
    init();
  }

  static final RecipientRepositories instance = RecipientRepositories._();
  String? phoneNumber;

  void init() {
    phoneNumber = AuthRepositories.instance.user?.phoneNumber!;
  }

  // Future<void> getProfile() async {
  //   final docRef =
  //   FirebaseFirestore.instance.collection(phoneNumber!).doc('user');
  //   docRef.get().then((DocumentSnapshot doc) async {
  //     final data = doc.data() as Map<String, dynamic>;
  //     final user = UserModel.fromJson(data);
  //     LocalDB.instance.registerAdapter2();
  //     LocalDB.instance.add2(user);
  //   }, onError: (e) => print("Error getting document: $e"));
  // }

  Future<void> add(
      String region,
      String city,
      String street,
      String name,
      String surname,
      String phoneNumber,
      String departmentNP,
      ) async {
    final data = RecipientModel(
      region: region,
      city: city,
      street: street,
      name: name,
      surname: surname,
      phoneNumber:  phoneNumber,
      departmentNP: departmentNP,
    );
    final json = data.toJson();
    FirebaseFirestore.instance
        .collection(phoneNumber)
        .doc('recipient')
        .update(json);
    print(json);
  }
}
