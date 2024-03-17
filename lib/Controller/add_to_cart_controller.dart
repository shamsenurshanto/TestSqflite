import 'package:get/get.dart';

import 'package:testhive/Controller/product_add_controller.dart';
import 'package:testhive/Model/add_to_cart_model.dart';
import 'package:testhive/Model/products_attributes.dart';
import 'package:testhive/Model/attribute_model.dart';

class AddToCartController extends GetxController {
  // var foodList = <dynamic>[].obs;
  var addToCartList = <AddToCartModel>[].obs;
  RxInt saveIdForLaterAddToCart = RxInt(0);

  @override
  void onInit() {
    // TODO: implement onInit

    // setAllValue();
    print("ooninit ");
  }
  addProductToCart(AddToCartModel addToCartModel){
    addToCartList.add(addToCartModel);
    addToCartList.forEach((element) {
      print(element);
    });
  }
  setAddToCartListAmount(int index){
    addToCartList[index].amount ++;
  }
}
