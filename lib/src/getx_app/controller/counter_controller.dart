import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  RxInt number = 0.obs;
  void increment() {
    number.value++;
    update();
  }

  void decrement() {
    number.value--;
    update();
  }
}

class CartController extends GetxController {
  RxList<ProductModel> product = <ProductModel>[].obs;
}

class ProductModel {}
