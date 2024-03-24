import 'package:e_commerce/controller/test_controller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TextController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: GetBuilder<TextController>(builder: (controller) {
        if (controller.statusRequest == StatusRequest.loading) {
          return const Center(child: Text("loading"));
        } else if (controller.statusRequest == StatusRequest.offlinefailure) {
          return const Center(child: Text("offline failure"));
        } else if (controller.statusRequest == StatusRequest.serverfailure) {
          return const Center(child: Text("server failure"));
        } else {
          return ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return Text("${controller.data}");
            },
          );
        }
      }),
    );
  }
}
