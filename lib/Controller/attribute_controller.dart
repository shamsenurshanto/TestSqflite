import 'package:get/get.dart';

import 'package:testhive/Controller/product_add_controller.dart';
import 'package:testhive/Model/products_attributes.dart';
import 'package:testhive/Model/attribute_model.dart';

class AttributeController extends GetxController {
  var foodList = <dynamic>[].obs;
  RxInt indi = RxInt(0);
  RxInt indexOfClickedButton = RxInt(0);

  RxString statusShow = RxString("1");
  RxBool indiSizeAttribute = RxBool(false);

  RxBool indiFlavAttribute = RxBool(false);

  RxBool indiSpiceAttribute = RxBool(false);

  var arrayof = <int>[].obs;

  var attributeList = <String>['Size', 'Flavour', 'Colors'].obs;

  final attributeListModel = Rxn<AttributeListModel>();

  @override
  void onInit() {
    // TODO: implement onInit

    setAllValue();
    print("ooninit ");
  }

  setAllValue() {
    // attributeListModel.value = AttributeListModel();
    print("set value called ");
    // attributeListModel.value?.attributeList.clear();
    attributeListModel.value!.attributeList.addAll(attributeList);
    for (int i = 0; i < attributeListModel.value!.attributeList.length; i++) {
      attributeListModel.value?.isSelected.add(false);
    }
    attributeListModel.refresh();
  }

  addAttributetoList(String attribute) {
    attributeListModel.value!.attributeList.add(attribute);
    attributeListModel.value!.isSelected.add(false);
    final ProductAddController product = Get.put(ProductAddController());

    attributeListModel.refresh();
    // controllerProductAdd.Lstring.clear();
    for (bool word in attributeListModel.value!.isSelected) {
      print(word);
      // controllerProductAdd.Lstring.addAll([]);
    }
  }

  getSelectedAttribute(int index) {
    attributeListModel.value?.isSelected[index] = !attributeListModel.value!.isSelected[index];
    //  print(attributeListModel.isSelected[index]);
    attributeListModel.refresh();
  }
}
