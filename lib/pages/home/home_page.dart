import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_every/controller/auth_controller.dart';
import 'package:getx_every/controller/home_controller.dart';

class HomePage extends GetView<AuthController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 상태 변경이 필요할 때는 ObX 함수를 사용한다.
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
              "로그인 상태 : ${controller.isLogin} 유저네임 : ${controller.user["username"]}"),
        ),
      ),
      body: Column(
        children: [
          // GetBuilder는 강제로 update함수를 호출하지 않는한 상태가 변경되도 UI는 다시 그려지지 않는다.
          GetBuilder<HomeController>(
            builder: (homeController) => Expanded(
              child: ListView(
                children: List.generate(
                    homeController.data.length,
                    (index) => ListTile(
                          title: Text(homeController.data[index]),
                        )),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/store");
            },
            child: Text("StorePage 화면 이동"),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  // 1. 로그인 테스트
                  controller.login();
                },
                child: Text("로그인 테스트"),
              ),
              ElevatedButton(
                onPressed: () {
                  // 2. putAsync 테스트 (이건 화면 그릴 때는 사용하면 안된다)
                  bool _isInitStorage = Get.find();
                  print("GetStorage 초기화 상태 : $_isInitStorage");
                  GetStorage().write("secret", "1234");
                },
                child: Text("putAsync 테스트"),
              ),
              ElevatedButton(
                onPressed: () {
                  String secret = GetStorage().read("secret") ?? "없음";
                  print("GetStorage 데이터 : $secret");
                },
                child: Text("GetStorage 테스트"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
