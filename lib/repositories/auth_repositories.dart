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

  Future<String> verifyAndLogin(
    String verificationId,
    String smsCode,
    String phone,
  ) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    final authCredential = await _auth!.signInWithCredential(credential);

    if (authCredential.user != null) {
      user = authCredential.user!;
      final uid = authCredential.user?.uid;
      final userSnap =
          await FirebaseFirestore.instance.collection(uid!).doc('user').get();
      if (!userSnap.exists) {
        await FirebaseFirestore.instance.collection(uid).doc('user').set({
          'userName': 'Имя',
          'userPhoneNumb': '+00(000)0000000',
          'userEmail': '',
          'userSex': null,
          'userDate': null,
        });
      }
      return uid;
    } else {
      return '';
    }
  }

  Future<String> getCredential(PhoneAuthCredential credential) async {
    final authCredential = await _auth!.signInWithCredential(credential);
    return authCredential.user!.uid;
  }
}
