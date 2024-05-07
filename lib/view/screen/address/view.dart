import 'package:e_commerce/controller/address/view_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/data/model/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          Get.toNamed(AppNamesRouts.addressadd);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text("Address"),
      ),
      body: GetBuilder<AddressViewController>(
          builder: (controller) => HandingDataView(
                statusRequest: controller.statusRequest,
                widget: Container(
                  child: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, i) => CardAddress(
                            addressModel: controller.data[i],
                            onDelete: () {
                              controller.deleteAddress(controller.data[i].addressId.toString());
                            },
                          )),
                ),
              )),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress(
      {super.key, required this.addressModel, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          title: Text(
            "Name /  ${addressModel.addressName} \n Tel /  ${addressModel.addressPhone}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          subtitle: Text(
            "${addressModel.addressCity} , ${addressModel.addressStreet}",
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
          trailing: IconButton(
              onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}
