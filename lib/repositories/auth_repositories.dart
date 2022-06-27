import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositories {
  AuthRepositories._() {
    init();
  }

  static final AuthRepositories instance = AuthRepositories._();

  final FirebaseAuth? _auth = FirebaseAuth.instance;
  User? user;

  void init() {
    user = _auth!.currentUser;
  }

  Future<void> verifyPhoneSendOtp(
    String phone, {
    void Function(PhoneAuthCredential)? completed,
    void Function(FirebaseAuthException)? failed,
    void Function(String, int?)? codeSent,
    void Function(String)? codeAutoRetrievalTimeout,
  }) async {
    await _auth?.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: completed!,
      verificationFailed: failed!,
      codeSent: codeSent!,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout!,
    );
  }

  Future<void> verifyAndLogin(
    String verificationId,
    String smsCode,
    String phone,
    String userName,
    String userEmail,
  ) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    final authCredential = await _auth!.signInWithCredential(credential);

    if (authCredential.user != null) {
      user = authCredential.user!;
      final phoneNumber = authCredential.user?.phoneNumber;
      final docSnap = await FirebaseFirestore.instance
          .collection(phoneNumber!)
          .doc('user')
          .get();
      if (docSnap.exists) {
        FirebaseFirestore.instance
            .collection(phoneNumber)
            .doc('user')
            .get()
            .then((DocumentSnapshot doc) {
          if (doc.data() != null) {
            final data = doc.data() as Map<String, dynamic>;
            final name = data['userName'];
            final email = data['userEmail'];
            if (name == '' && email == '') {
              FirebaseFirestore.instance
                  .collection(phoneNumber)
                  .doc('user')
                  .set({
                'userName': userName,
                'userPhoneNumb': phone,
                'userEmail': userEmail,
                'userSex': null,
                'userDate': '',
              });
            }
          }
        });
      } else {
        FirebaseFirestore.instance.collection(phoneNumber).doc('user').set({
          'userName': userName,
          'userPhoneNumb': phone,
          'userEmail': userEmail,
          'userSex': null,
          'userDate': null,
        });
      }
    }
  }

  Future<String> getCredential(PhoneAuthCredential credential) async {
    final authCredential = await _auth!.signInWithCredential(credential);
    return authCredential.user!.uid;
  }
}
