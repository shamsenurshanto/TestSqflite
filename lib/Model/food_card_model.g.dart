// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_card_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodCardModelAdapter extends TypeAdapter<FoodCardModel> {
  @override
  final int typeId = 1;

  @override
  FoodCardModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodCardModel()
      ..name = fields[0] as String?
      ..details = fields[1] as String?
      ..price = fields[2] as String?
      ..id = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, FoodCardModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.details)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FoodCardModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
