import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  get colorsgr => null;

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: "Find Product",
                          hintStyle:
                              TextStyle(color: Colors.grey[500], fontSize: 18),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 65,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15)),
                    child: const Icon(
                      Icons.notifications_active_outlined,
                      size: 40,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20)),
                    child: const ListTile(
                      title: Text(
                        "Asummer Surprise",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      subtitle: Text(
                        "Cashback  20%",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -20,
                    right: -20,
                    child: Container(
                      height: 160,
                      width: 160,
                      decoration: BoxDecoration(
                          color: AppColor.secondColor,
                          borderRadius: BorderRadius.circular(160)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
