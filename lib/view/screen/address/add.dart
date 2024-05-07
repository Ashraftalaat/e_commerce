import 'package:e_commerce/controller/address/add_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    AddAddressController controllerPage = Get.put(AddAddressController());
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      appBar: AppBar(
        title: const Text("Add New Address"),
      ),
      body: Container(
        child: GetBuilder<AddAddressController>(
          builder: (controllerPage) => HandingDataView(
            statusRequest: controllerPage.statusRequest,
            widget: Column(
              children: [
                if (controllerPage.kGooglePlex != null)
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GoogleMap(
                          mapType: MapType.normal,
                          markers: controllerPage.markers.toSet(),
                          onTap: (latlong) {
                            controllerPage.addMarkers(latlong);
                          },
                          initialCameraPosition: controllerPage.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            controllerPage.completerController
                                .complete(controller);
                          },
                        ),
                        Positioned(
                          bottom: 15,
                          child: Container(
                            height: 45,
                            width: 220,
                            color: AppColor.primaryColor,
                            child: MaterialButton(
                              onPressed: () {
                                controllerPage.gotoPageDetailsAddress();
                              },
                              child: Text(
                                "أكمال",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
