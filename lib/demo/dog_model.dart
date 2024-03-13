import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';

import '../Controller/foodLocalDbController/food_category_db_controller.dart';
import '../Controller/food_card_controller.dart';

class Dog {
  final String name;
  final int age;
  final List<String> color;

  // final List<>

  Dog({required this.name, required this.age, required this.color});

  Map<String, Object?> toMap() {
    return {
      'name': name,
      'age': age,
      'color': color.join(','),
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    final List<String> colors = (map['color'] as String).split(',');
    return Dog(
      name: map['name'] as String,
      age: map['age'] as int,
      color: colors,
    );
  }

  @override
  String toString() {
    return 'Dog{id: name: $name, age: $age}';
  }
}

class Human {
  final int id;
  final String name;
  final int age;
  final List<String> color;

  // final List<>

  Human({required this.id, required this.name, required this.age, required this.color});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'color': color.join(','),
    };
  }

  factory Human.fromMap(Map<String, dynamic> map) {
    final List<String> colors = (map['color'] as String).split(',');
    return Human(
      id: map['id'] as int,
      name: map['name'] as String,
      age: map['age'] as int,
      color: colors,
    );
  }

  @override
  String toString() {
    return 'Human{id: $id, name: $name, age: $age}';
  }
}

createTable() async {
  try {
    final db = await openDatabase('my_database.db');
    await db.execute(
      'CREATE TABLE dogs2(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, color TEXT)',
    );
    await db.execute(
      'CREATE TABLE human(vid INTEGER PRIMARY KEY AUTOINCREMENT, id INTEGER , name TEXT, age INTEGER, color TEXT)',
    );
  } catch (e) {
    print(e);
  }
}

// Define a function that inserts dogs into the database
Future<void> insertDogAndHuman(Dog dog, Human human) async {
  // Get a reference to the database.
  final db = await openDatabase('my_database.db');

  await db.insert(
    'dogs2',
    dog.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<void> Humanattribute(Human human) async {
  // Get a reference to the database.
  final db = await openDatabase('my_database.db');
  await db.insert(
    'human',
    human.toMap(),
  );
}

Future<List<Map<String, dynamic>>> retrieveTasks() async {
  final db = await openDatabase('my_database.db');
  return await db.query('dogs2');
}

Future<List<Map<String, dynamic>>> joinTable() async {
  final db = await openDatabase('my_database.db');
  return await db.rawQuery('''
      SELECT dogs2.id as dog_id,human.id as human_id, human.name as human_name, human.age as human_age,human.color as human_color
      FROM dogs2
      INNER JOIN human ON dogs2.id = human.id
    ''');
}

deleteHumanandDogTable() async {
  final db = await openDatabase('my_database.db');
  db.rawQuery('DROP TABLE IF EXISTS human;');
  db.rawQuery('DROP TABLE IF EXISTS dogs2;');
}

Future<void> printJoinedData() async {
  final joinedData = await joinTable();
  final doglist = await retrieveTasks();
  // for (final row in doglist) {
  //   print('ID: ${row['id']}');
  //   print('Name: ${row['name']}');
  //   print('Age: ${row['age']}');
  //   print('Color: ${row['color']}');
  // }

  for (final row in joinedData) {
    print('Joined Data:');
    print('Dog Details:');
    print('ID: ${row['dog_id']}');
    print('Name: ${row['dogs.name']}');
    print('Age: ${row['dogs.age']}');
    print('Color: ${row['dogs.color']}');

    print('Human Details:');
    print('Name: ${row['human_id']}');
    print('Name: ${row['human_name']}');
    print('Age: ${row['human_age']}');
    print('color: ${row['human_color']}');
    print('---');
  }
}

class AddSql extends StatefulWidget {
  @override
  _AddSqlState createState() => _AddSqlState();
}

class _AddSqlState extends State<AddSql> {
  // Add any state variables or methods you need here

  // Example function to be called when the button is clicked
  void added() {
    // Implement your logic here
    print('Button clicked! Execute your SQL or any other action.');
  }

  @override
  Widget build(BuildContext context) {
    final foodCategoryTable controllerFoodCard = Get.put(foodCategoryTable());
    return Scaffold(
      appBar: AppBar(
        title: Text('Add SQL Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Your button to trigger the added function
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.red,
                child: InkWell(
                  onTap: () async {
                    print("hello");
                    // createDB();
                    // createDogTable();
                    // Create a Dog and add it to the dogs table
                    var fido = FoodName(name: 'Fsddido', price: 20, img: "", category: "breakfast");
                    var himo = AttributeList(id: 2, name: 'solar', age: 35, attributeList: ['monday', 'blue', 'red']);

                    // controllerFoodCard.createTable();

                    try {
                      await controllerFoodCard.insertFoodName(fido);
                      await controllerFoodCard.insertAttributeList(himo);
                      await controllerFoodCard.printJoinedData();
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Click Me'),
                ),
              ),
            ),

            Container(
              color: Colors.red,
              child: InkWell(
                onTap: () async {
                  print("hello human ");

                  controllerFoodCard.deleteFoodAndAttributelistTable();
                  await controllerFoodCard.createTable();
                },
                child: Text('Click Me human '),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
