// note you have to hardcode this part
// for example => (part 'classname.g.dart');
// class name must be in lower case
import 'package:hive/hive.dart';

// this line must be written by you
// for example => ( part 'filename.g.dart'; )
// FILENAME not class name and also all in lower case
part 'food_card_model.g.dart';

@HiveType(typeId: 1) // id must be unique
class FoodCardModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? details;
  @HiveField(2)
  String? price;
  @HiveField(3)
  String? id;

  // you must provide empty constructor
  // so hive can generate(serializable) object
  // so you u can store this object in local db (hive)
  FoodCardModel();

  FoodCardModel.fromData({this.name, this.details, this.price, this.id});

  @override
  String toString() {
    return 'Username => $name\nPhone number  => $details\nPin => $price\nId => $id';
  }
}
