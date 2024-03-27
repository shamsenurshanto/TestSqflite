
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sqflite/sqflite.dart';

class DashboardControllerR extends GetxController {

   Future<List<Map<String, dynamic>>> getAllFromCategoryModel() async {
    //SELECT * FROM categoryModel;
    final db = await openDatabase('my_database.db');
    return await db.rawQuery('''SELECT categoryModel.name as categoryModel_name,categoryModel.id as categoryModel_id FROM categoryModel''');
  }
  
   var categoryList =<String>[].obs;
   setAllCategoryList() async {
    try {
      final joinedData = await getAllFromCategoryModel();
      
      for (final row in joinedData) {
        print('Print Data:');
        print('categoryModel Details:');
        print('categoryModel_name: ${row['categoryModel_name']}');
        print('categoryModel_id: ${row['categoryModel_id']}');
        print('---------');
        
       
      }
     
    } catch (e) {
      print(e);
      print("setItemVarriationPriceModel");
    }
   }

}