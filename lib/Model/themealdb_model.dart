import 'package:hive/hive.dart';

part 'themealdb_model.g.dart';

@HiveType(typeId: 2)
class FruitCreamCheeseBreakfastPastriesModel {
  @HiveField(0)
  String? idMeal;
  @HiveField(1)
  String? strMeal;
  @HiveField(2)
  String? strDrinkAlternate;
  @HiveField(3)
  String? strCategory;
  @HiveField(4)
  String? strArea;
  @HiveField(5)
  String? strInstructions;
  @HiveField(6)
  String? strMealThumb;
  @HiveField(7)
  String? strTags;
  @HiveField(8)
  String? strYoutube;
  @HiveField(9)
  String? strIngredient1;
  @HiveField(10)
  String? strIngredient2;
  @HiveField(11)
  String? strIngredient3;
  @HiveField(12)
  String? strIngredient4;
  @HiveField(13)
  String? strIngredient5;
  @HiveField(14)
  String? strIngredient6;
  @HiveField(15)
  String? strIngredient7;
  @HiveField(16)
  String? strIngredient8;
  @HiveField(17)
  String? strIngredient9;
  @HiveField(18)
  String? strIngredient10;
  @HiveField(19)
  String? strMeasure1;
  @HiveField(20)
  String? strMeasure2;
  @HiveField(21)
  String? strMeasure3;
  @HiveField(22)
  String? strMeasure4;
  @HiveField(23)
  String? strMeasure5;
  @HiveField(24)
  String? strMeasure6;
  @HiveField(25)
  String? strMeasure7;
  @HiveField(26)
  String? strMeasure8;
  @HiveField(27)
  String? strMeasure9;
  @HiveField(28)
  String? strMeasure10;
  @HiveField(29)
  String? strSource;
  @HiveField(30)
  String? strImageSource;
  @HiveField(31)
  String? strCreativeCommonsConfirmed;
  @HiveField(32)
  String? dateModified;

  FruitCreamCheeseBreakfastPastriesModel();

  FruitCreamCheeseBreakfastPastriesModel.fromData({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  @override
  String toString() {
    return 'ID Meal => $idMeal\nMeal => $strMeal\nDrink Alternate => $strDrinkAlternate\nCategory => $strCategory\nArea => $strArea\nInstructions => $strInstructions\nMeal Thumb => $strMealThumb\nTags => $strTags\nYoutube => $strYoutube\nIngredient 1 => $strIngredient1\nIngredient 2 => $strIngredient2\nIngredient 3 => $strIngredient3\nIngredient 4 => $strIngredient4\nIngredient 5 => $strIngredient5\nIngredient 6 => $strIngredient6\nIngredient 7 => $strIngredient7\nIngredient 8 => $strIngredient8\nIngredient 9 => $strIngredient9\nIngredient 10 => $strIngredient10\nMeasure 1 => $strMeasure1\nMeasure 2 => $strMeasure2\nMeasure 3 => $strMeasure3\nMeasure 4 => $strMeasure4\nMeasure 5 => $strMeasure5\nMeasure 6 => $strMeasure6\nMeasure 7 => $strMeasure7\nMeasure 8 => $strMeasure8\nMeasure 9 => $strMeasure9\nMeasure 10 => $strMeasure10\nSource => $strSource\nImage Source => $strImageSource\nCreative Commons Confirmed => $strCreativeCommonsConfirmed\nDate Modified => $dateModified';
  }
}
