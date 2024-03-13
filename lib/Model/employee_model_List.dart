//employee_model_List

// note you have to hardcode this part
// for example => (part 'classname.g.dart');
// class name must be in lower case
import 'package:hive/hive.dart';
import 'package:testhive/Model/employee_model.dart';

// this line must be written by you
// for example => ( part 'filename.g.dart'; )
// FILENAME not class name and also all in lower case
part 'employee_model_List.g.dart';

@HiveType(typeId: 3) // id must be unique
class employee_model_List {
  @HiveField(0)
  List<EmployeeModel>? empList;

  // you must provide empty constructor
  // so hive can generate(serializable) object
  // so you u can store this object in local db (hive)
  employee_model_List();

  employee_model_List.fromData({this.empList});

  @override
  String toString() {
    return 'empList => $empList\n';
  }
}
