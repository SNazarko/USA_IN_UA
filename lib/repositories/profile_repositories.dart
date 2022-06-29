import 'package:cloud_firestore/cloud_firestore.dart';

import '../database/local_database.dart';
import '../models/user_model.dart';
import 'auth_repositories.dart';

class ProfileRepositories {
  ProfileRepositories._() {
    init();
  }

  static final ProfileRepositories instance = ProfileRepositories._();
  String? phoneNumber;

  void init() {
    phoneNumber = AuthRepositories.instance.user?.phoneNumber!;
  }

  Future<void> getProfile() async {
    final docRef =
        FirebaseFirestore.instance.collection(phoneNumber!).doc('user');
    docRef.get().then((DocumentSnapshot doc) async {
      final data = doc.data() as Map<String, dynamic>;
      final user = UserModel.fromJson(data);
      LocalDB.instance.registerAdapter2();
      LocalDB.instance.add2(user);
    }, onError: (e) => print("Error getting document: $e"));
  }

  Future<void> updateProfile(
    String userName,
    String userEmail,
    String userPhoneNumb,
    String userDate,
    bool userSex,
  ) async {
    final user = UserModel(
      userName: userName,
      userEmail: userEmail,
      userPhoneNumb: userPhoneNumb,
      userDate: userDate,
      userSex: userSex,
    );
    final json = user.toJson();
    FirebaseFirestore.instance
        .collection(phoneNumber!)
        .doc('user')
        .update(json);
    print(json);
  }
}
