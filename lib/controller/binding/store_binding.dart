import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_every/controller/home_controller.dart';
import 'package:getx_every/controller/store_controller.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    // lazyPut을 사용하면 find할 때 객체가 만들어진다.
    // 이렇게 한 이유는 버튼을 클릭할 때 데이터를 불러올 것이기 때문이다.
    // 미리 페이지 이동할 때 데이터가 초기화 될 필요가 없다.
    Get.lazyPut(() => StoreController());
    Get.put(HomeController());
  }
}
