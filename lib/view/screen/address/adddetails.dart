import 'package:e_commerce/controller/address/adddetails_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/shared/custombutton.dart';
import 'package:e_commerce/core/shared/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddDetailsAddressController());
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      appBar: AppBar(
        title: const Text("Add Details Address"),
      ),
      body: GetBuilder<AddDetailsAddressController>(
        builder: (controller) => HandingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomTextForm(
                  texthint: "city",
                  textlabel: "City",
                  iconData: Icons.location_city,
                  mycontroller: controller.city!,
                  vaild: (val) {},
                  isNumber: false),
              CustomTextForm(
                  texthint: "street",
                  textlabel: "Street",
                  iconData: Icons.streetview,
                  mycontroller: controller.street!,
                  vaild: (val) {},
                  isNumber: false),
              CustomTextForm(
                  texthint: "name",
                  textlabel: "Name",
                  iconData: Icons.person_2_rounded,
                  mycontroller: controller.name!,
                  vaild: (val) {},
                  isNumber: false),
              CustomTextForm(
                  texthint: "phone",
                  textlabel: "Phone",
                  iconData: Icons.phone,
                  mycontroller: controller.phone!,
                  vaild: (val) {},
                  isNumber: false),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                text: "Add",
                onPressed: () {
                  controller.addAdress();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
