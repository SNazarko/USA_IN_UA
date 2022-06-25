import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 1)
class CardModel {

  CardModel({
     this.cardNumber,
    this.cardDate,
    this.isCard,
    this.cardCvv,
    this.usedCard,
  });

  @HiveField(0)
  String? cardNumber;

  @HiveField(1)
  String? cardDate;

  @HiveField(2)
  String? cardCvv;

  @HiveField(3)
  bool? isCard;

  @HiveField(4)
  bool? usedCard;
 CardModel copyWith ({
   String? cardNumber,
   String? cardDate,
   String? cardCvv,
   bool? isCard,
   bool? usedCard,

}){
   return CardModel(
   cardNumber: cardNumber ?? this.cardNumber,
   cardDate: cardDate ?? this.cardDate,
isCard: isCard ?? this.isCard,
cardCvv: cardCvv ?? this.cardCvv,
usedCard: usedCard ?? this.usedCard
);
 }

}