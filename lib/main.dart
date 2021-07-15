import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_every/controller/auth_controller.dart';
import 'package:getx_every/controller/binding/auth_binding.dart';
import 'package:getx_every/controller/binding/home_binding.dart';
import 'package:getx_every/controller/binding/store_binding.dart';
import 'package:getx_every/controller/home_controller.dart';
import 'package:getx_every/pages/home/home_page.dart';
import 'package:getx_every/pages/store/store_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // 모든 페이지에서 AuthController()가 필요하다면 초기화 해두는 것이 좋다.
      initialBinding: AuthBinding(),
      initialRoute: "/home",
      getPages: [
        GetPage(
          name: "/home",
          page: () => HomePage(),
          transition: Transition.fade,
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/store",
          page: () => StorePage(),
          transition: Transition.zoom,
          binding: StoreBinding(),
        ),
      ],
    );
  }
}
