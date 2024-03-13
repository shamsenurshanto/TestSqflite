// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'themealdb_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FruitCreamCheeseBreakfastPastriesModelAdapter extends TypeAdapter<FruitCreamCheeseBreakfastPastriesModel> {
  @override
  final int typeId = 2;

  @override
  FruitCreamCheeseBreakfastPastriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FruitCreamCheeseBreakfastPastriesModel()
      ..idMeal = fields[0] as String?
      ..strMeal = fields[1] as String?
      ..strDrinkAlternate = fields[2] as String?
      ..strCategory = fields[3] as String?
      ..strArea = fields[4] as String?
      ..strInstructions = fields[5] as String?
      ..strMealThumb = fields[6] as String?
      ..strTags = fields[7] as String?
      ..strYoutube = fields[8] as String?
      ..strIngredient1 = fields[9] as String?
      ..strIngredient2 = fields[10] as String?
      ..strIngredient3 = fields[11] as String?
      ..strIngredient4 = fields[12] as String?
      ..strIngredient5 = fields[13] as String?
      ..strIngredient6 = fields[14] as String?
      ..strIngredient7 = fields[15] as String?
      ..strIngredient8 = fields[16] as String?
      ..strIngredient9 = fields[17] as String?
      ..strIngredient10 = fields[18] as String?
      ..strMeasure1 = fields[19] as String?
      ..strMeasure2 = fields[20] as String?
      ..strMeasure3 = fields[21] as String?
      ..strMeasure4 = fields[22] as String?
      ..strMeasure5 = fields[23] as String?
      ..strMeasure6 = fields[24] as String?
      ..strMeasure7 = fields[25] as String?
      ..strMeasure8 = fields[26] as String?
      ..strMeasure9 = fields[27] as String?
      ..strMeasure10 = fields[28] as String?
      ..strSource = fields[29] as String?
      ..strImageSource = fields[30] as String?
      ..strCreativeCommonsConfirmed = fields[31] as String?
      ..dateModified = fields[32] as String?;
  }

  @override
  void write(BinaryWriter writer, FruitCreamCheeseBreakfastPastriesModel obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.idMeal)
      ..writeByte(1)
      ..write(obj.strMeal)
      ..writeByte(2)
      ..write(obj.strDrinkAlternate)
      ..writeByte(3)
      ..write(obj.strCategory)
      ..writeByte(4)
      ..write(obj.strArea)
      ..writeByte(5)
      ..write(obj.strInstructions)
      ..writeByte(6)
      ..write(obj.strMealThumb)
      ..writeByte(7)
      ..write(obj.strTags)
      ..writeByte(8)
      ..write(obj.strYoutube)
      ..writeByte(9)
      ..write(obj.strIngredient1)
      ..writeByte(10)
      ..write(obj.strIngredient2)
      ..writeByte(11)
      ..write(obj.strIngredient3)
      ..writeByte(12)
      ..write(obj.strIngredient4)
      ..writeByte(13)
      ..write(obj.strIngredient5)
      ..writeByte(14)
      ..write(obj.strIngredient6)
      ..writeByte(15)
      ..write(obj.strIngredient7)
      ..writeByte(16)
      ..write(obj.strIngredient8)
      ..writeByte(17)
      ..write(obj.strIngredient9)
      ..writeByte(18)
      ..write(obj.strIngredient10)
      ..writeByte(19)
      ..write(obj.strMeasure1)
      ..writeByte(20)
      ..write(obj.strMeasure2)
      ..writeByte(21)
      ..write(obj.strMeasure3)
      ..writeByte(22)
      ..write(obj.strMeasure4)
      ..writeByte(23)
      ..write(obj.strMeasure5)
      ..writeByte(24)
      ..write(obj.strMeasure6)
      ..writeByte(25)
      ..write(obj.strMeasure7)
      ..writeByte(26)
      ..write(obj.strMeasure8)
      ..writeByte(27)
      ..write(obj.strMeasure9)
      ..writeByte(28)
      ..write(obj.strMeasure10)
      ..writeByte(29)
      ..write(obj.strSource)
      ..writeByte(30)
      ..write(obj.strImageSource)
      ..writeByte(31)
      ..write(obj.strCreativeCommonsConfirmed)
      ..writeByte(32)
      ..write(obj.dateModified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FruitCreamCheeseBreakfastPastriesModelAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
