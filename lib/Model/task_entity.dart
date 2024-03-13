import 'package:hive_flutter/hive_flutter.dart';

part 'task_entity.g.dart';

@HiveType(typeId: 2)
class Task {
  @HiveField(0)
  String? Date;
  @HiveField(1)
  var content;

  // you must provide empty constructor
  // so hive can generate(serializable) object
  // so you u can store this object in local db (hive)
  Task();

  Task.fromData({
    this.Date,
    this.content,
  });

  @override
  String toString() {
    return 'Date => $Date\n content  => $content';
  }
}
