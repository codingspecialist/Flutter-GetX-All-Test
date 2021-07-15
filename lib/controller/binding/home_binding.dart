import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_every/controller/home_controller.dart';

// binding은 page에 하는 것이다. page가 없으면 굳이 binding을 만들 필요가 없다.
// 예를 들어 현재 프로젝트에는 user관련 페이지가 없기 때문에 UserBiding을 만들지 않았다.
// 하지만 전역적으로 모든 페이지에서 인증 관련 상태 데이터가 필요하여 AuthBinding을 만들었다.
// 인증 관련 binding은 페이지가 없어도 모든 페이지에서 사용해서 만든 것이다.
class HomeBinding implements Bindings {
  // 하나의 페이지에 여러개의 데이터를 주입할 수 있다. HomeController + isInitStorage
  @override
  void dependencies() {
    // putAsync를 사용하면 비동기 작업이 완료된 후 객체를 주입할 수 있다.
    Get.putAsync<bool>(() async {
      bool isInitStorage = await GetStorage.init();
      print("GetStorage 초기화 완료");
      return isInitStorage;
    });

    Get.put(HomeController());
  }
}
