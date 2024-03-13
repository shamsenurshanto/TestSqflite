// note you have to hardcode this part
// for example => (part 'classname.g.dart');
// class name must be in lower case
import 'package:hive/hive.dart';

// this line must be written by you
// for example => ( part 'filename.g.dart'; )
// FILENAME not class name and also all in lower case
part 'date_list.g.dart';

@HiveType(typeId: 10) // id must be unique
class DateList {
  @HiveField(0)
  List? employeeList;
  @HiveField(1)
  List? employeeListStatus;

  // you must provide empty constructor
  // so hive can generate(serializable) object
  // so you u can store this object in local db (hive)
  DateList();

  DateList.fromData({
    this.employeeList,
    this.employeeListStatus,
  });

  @override
  String toString() {
    return 'employeeList => $employeeList\n employeeListStatus number  => $employeeListStatus\n';
  }
}
