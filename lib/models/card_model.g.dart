// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CardModelAdapter extends TypeAdapter<CardModel> {
  @override
  final int typeId = 1;

  @override
  CardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CardModel(
      cardNumber: fields[0] as String,
      cardDate: fields[1] as String,
      isCard: fields[3] as bool,
      cardCvv: fields[2] as String,
      usedCard: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CardModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.cardNumber)
      ..writeByte(1)
      ..write(obj.cardDate)
      ..writeByte(2)
      ..write(obj.cardCvv)
      ..writeByte(3)
      ..write(obj.isCard)
      ..writeByte(4)
      ..write(obj.usedCard);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
