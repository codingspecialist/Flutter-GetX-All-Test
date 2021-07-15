import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<String> data = <String>[].obs;

  // onInit() 함수를 사용하면 HomeController() 객체 생성시 초기화를 할 수 있다.
  @override
  void onInit() {
    print("HomeController onInit()");
    super.onInit();
    this.data.value = ["data1", "data2", "data3", "data4"];
  }
}
