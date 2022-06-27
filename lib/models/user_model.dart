import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 2)
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
  @HiveField(0)
  String? userName;
  @HiveField(1)
  String? userPhoneNumb;
  @HiveField(3)
  String? userEmail;
  @HiveField(4)
  bool? userSex;
  @HiveField(5)
  String? userDate;

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userPhoneNumb': userPhoneNumb,
        'userEmail': userEmail,
        'userSex': userSex,
        'userDate': userDate
      };
}
