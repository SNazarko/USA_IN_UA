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
    authCredential.user?.updateDisplayName(userName);
    authCredential.user?.updateEmail(userEmail);
    final name = authCredential.user?.displayName;
    final email = authCredential.user?.email;
    if (authCredential.user != null) {
      user = authCredential.user!;
      final phoneNumber = authCredential.user?.phoneNumber;
      final userSnap = await FirebaseFirestore.instance
          .collection(phoneNumber!)
          .doc('user')
          .get();
      if (!userSnap.exists) {
        await FirebaseFirestore.instance
            .collection(phoneNumber)
            .doc('user')
            .set({
          'userName': name,
          'userPhoneNumb': phone,
          'userEmail': email,
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
