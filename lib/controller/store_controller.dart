import 'package:get/get.dart';
import 'package:getx_every/controller/home_controller.dart';

class StoreController extends GetxController {
  HomeController homeController = Get.find();

  void addData() {
    this.homeController.data.add("newData");
    // GetBuilder UI 동기화 하고 싶다면 아래 주석을 풀어보자.
    //this.homeController.update();
  }
}
