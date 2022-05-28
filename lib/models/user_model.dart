import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.userName,
    this.userPhoneNumb,
    this.userEmail,
    this.userSex,
    this.userDate,
  });

  factory UserModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return UserModel(
      userName: json['userName'],
      userPhoneNumb: json['userPhoneNumb'],
      userEmail: json['userEmail'],
      userSex: json['userSex'],
      userDate: json['userDate'],
    );
  }
  String? userName;
  String? userPhoneNumb;
  String? userEmail;
  bool? userSex;
  Timestamp? userDate;

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userPhoneNumb': userPhoneNumb,
        'userEmail': userEmail,
        'userSex': userSex,
        'userDate': userDate
      };
}
