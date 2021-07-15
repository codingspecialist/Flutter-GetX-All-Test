import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLogin = false.obs;
  RxMap user = {}.obs;

  void login() {
    this.isLogin.value = true;
    this.user.value = {"id": 1, "username": "ssar", "email": "ssar@nate.com"};
  }

  void logout() {
    this.isLogin.value = false;
    this.user.value = {};
  }
}
