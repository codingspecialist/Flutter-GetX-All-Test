import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_every/controller/auth_controller.dart';
import 'package:getx_every/controller/home_controller.dart';
import 'package:getx_every/controller/store_controller.dart';

class StorePage extends GetView<AuthController> {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("로그인 상태 : ${controller.isLogin}"),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: homeController.data.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(homeController.data[index]),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("추가"),
        onPressed: () {
          Get.find<StoreController>().addData();
        },
      ),
    );
  }
}
