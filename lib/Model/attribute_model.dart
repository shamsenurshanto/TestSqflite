import 'package:get/get.dart';

class AttributeList {
  final int id;
  final String name;
  final int age;
  final List<String> attributeList;

  // final List<>

  AttributeList({required this.id, required this.name, required this.age, required this.attributeList});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'attributeList': attributeList.join(','),
    };
  }

  @override
  String toString() {
    return 'AttributeList{id: $id, name: $name, age: $age}';
  }
}

