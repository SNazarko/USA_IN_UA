import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 1)
class CardModel {

  CardModel({
    required this.cardNumber,
    required this.cardDate,
    required this.isCard,
    required this.cardCvv,});

  @HiveField(0)
  String cardNumber;

  @HiveField(1)
  String cardDate;

  @HiveField(2)
  String cardCvv;

  @HiveField(3)
  bool isCard;}