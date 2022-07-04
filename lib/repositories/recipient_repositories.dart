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

  Stream<List<RecipientModel>> readAudio() => FirebaseFirestore.instance
      .collection(phoneNumber!)
      .doc('recipient')
      .collection('recipient')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((doc) => RecipientModel.fromJson(doc.data())).toList());

  Future<Future<List<RecipientModel>>?> getRecipient() async {
    var isExists = await FirebaseFirestore.instance
        .collection(phoneNumber!)
        .doc('recipient')
        .get()
        .then((value) {
      return value.exists;
    });
    if (!isExists) {
      var recipient = FirebaseFirestore.instance
          .collection(phoneNumber!)
          .doc('recipient')
          .collection('recipient')
          .get()
          .then((res) => res.docs
              .map((doc) => RecipientModel.fromJson(doc.data()))
              .toList());
      return recipient;
    } else {
      return null;
    }
  }

  Future<void> add(
    String region,
    String city,
    String street,
    String name,
    String surname,
    String phone,
    String departmentNP,
    String addressName,
    bool isCard,
    bool userCard,
  ) async {
    final data = RecipientModel(
      addressName: addressName,
      region: region,
      city: city,
      street: street,
      name: name,
      surname: surname,
      phoneNumber: phone,
      departmentNP: departmentNP,
      isCard: isCard,
      userCard: userCard,
    );
    final json = data.toJson();
    FirebaseFirestore.instance
        .collection(phoneNumber!)
        .doc('recipient')
        .collection('recipient')
    .doc(addressName)
        .set(json);
    print(json);
  }
  Future<void> delete(
      String addressName,
      ) async {
    FirebaseFirestore.instance
        .collection(phoneNumber!)
        .doc('recipient')
        .collection('recipient')
        .doc(addressName)
.delete();
  }
}
