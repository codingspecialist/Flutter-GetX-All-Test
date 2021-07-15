import 'package:get/get.dart';
import 'package:getx_every/controller/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    // permanent 속성에 true를 주면 객체가 가비지 컬렉션 되지 않는다.
    Get.put(AuthController(), permanent: true);
  }
}
