// note you have to hardcode this part
// for example => (part 'classname.g.dart');
// class name must be in lower case
import 'package:hive/hive.dart';

// this line must be written by you
// for example => ( part 'filename.g.dart'; )
// FILENAME not class name and also all in lower case
part 'employee_model.g.dart';

@HiveType(typeId: 1) // id must be unique
class EmployeeModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? phone;
  @HiveField(2)
  String? pin;
  @HiveField(3)
  String? id;

  // you must provide empty constructor
  // so hive can generate(serializable) object
  // so you u can store this object in local db (hive)
  EmployeeModel();

  EmployeeModel.fromData({this.name, this.phone, this.pin, this.id});

  @override
  String toString() {
    return 'Username => $name\nPhone number  => $phone\nPin => $pin\nId => $id';
  }
}
