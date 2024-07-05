import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/getdecodepolyline.dart';
import 'package:e_commerce/core/services/serviceslocal.dart';
import 'package:e_commerce/data/model/orders/orders.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingController extends GetxController {
  // StreamSubscription<Position>? positionStream;
  GoogleMapController? gmc;
//  GoogleMapController? gmc;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;
  //موقع عامل التوصيل
  double? destlat;
  double? destlong;
  double? currentlat;
  double? currenlong;

  Set<Polyline> polylineset = {};

  // Timer? timer;
  late OrdersModel ordersModel;
  MyServices myServices = Get.find();
//  OrdersAcceptedController ordersAcceptedController = Get.find();
  StatusRequest statusRequest = StatusRequest.success;

  // donedelivery() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   await ordersAcceptedController.doneDelivery(
  //       ordersModel.ordersId.toString(), ordersModel.ordersUsersid.toString());
  //   Get.offAllNamed(AppNamesRouts.homescreen);
  // }

  intialData() {
    cameraPosition = CameraPosition(
      target: LatLng(double.parse(ordersModel.addressLat.toString()),
          double.parse(ordersModel.addressLong.toString())),
      // 37.415416
      zoom: 12.4746,
    );
    // اضافة نقطة موقع المندوب
    markers.add(
      Marker(
          markerId: const MarkerId("current"),
          position: LatLng(double.parse(ordersModel.addressLat!.toString()),
              double.parse(ordersModel.addressLong!.toString()))),
    );
    //   positionStream = Geolocator.getPositionStream().listen(
    //     (Position? position) {
    //       print("=============== Current position ===============");
    //       currentlat = position!.latitude;
    //       currenlong = position.longitude;
    //       print(currentlat);
    //       print(currenlong);
    //       // لتحريك الكاميرا علي مكان نقطة الموقع
    //       if (gmc != null) {
    //         gmc!.animateCamera(
    //             CameraUpdate.newLatLng(LatLng(currentlat!, currenlong!)));
    //       }

    //       markers.removeWhere((element) => element.markerId.value == "current");
    //       // اضافة نقطة موقع مندوب التوصيل
    //       markers.add(
    //         Marker(
    //           markerId: const MarkerId("current"),
    //           position: LatLng(
    //             position.latitude,
    //             position.longitude,
    //           ),
    //         ),
    //       );
    //       update();
    //     },
    //   );
  }

  getlocationDelivery() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersModel.ordersId.toString())
        //snapshots().listen  عشان realtime
        //نفس stream بتاعت  Geolocator.getPositionStream().listen
        .snapshots()
        .listen((event) {
      if (event.exists) {
        //موقع مندوب التوصيل
        destlat = event.get("lat");
        destlong = event.get("long");
        updatemarkerDelivery(destlat!, destlong!);
      }
    });
  }

  updatemarkerDelivery(double newlat, double newlong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    // اضافة نقطة موقع مندوب التوصيل
    markers.add(
      Marker(
        markerId: const MarkerId("dest"),
        position: LatLng(
          newlat,
          newlat,
        ),
      ),
    );
    update();
  }

// // لرؤية العميل موقع مندوب التوصيل والتوجه الية
// //هنستخدم firebase stream افضل من sql وphp لانهم بيستخدموا node js مع package socket io
//   refreshLocation() async {
//     //هينتظر 2 ثانية حتي يجلب currentlat ,currentlong
//     await Future.delayed(const Duration(seconds: 2));
//     //يتم تحديث الاحداثيات كل 10 ثواني واضافتها للdoc
//     timer = Timer.periodic(const Duration(seconds: 5), (timer) {
//       FirebaseFirestore.instance
//           .collection("delivery")
//           .doc(ordersModel.ordersId.toString())
//           .set({
//         'lat': currentlat!,
//         'long': currenlong!,
//         'deliveryid': myServices.sharedPreferences.getString('id')
//       });
//     });
//     update();
//   }

// لرسم خط بين نقطتين
  initPolyline() async {
    destlat = double.parse(ordersModel.addressLat!.toString());
    destlong = double.parse(ordersModel.addressLong!.toString());
    await Future.delayed(const Duration(seconds: 1));
    polylineset = await getPolyLine(currentlat, currenlong, destlat, destlong);
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordermodel'];
    intialData();
    // refreshLocation();
    initPolyline();
    getlocationDelivery();
    super.onInit();
  }

  // حتي لايحدث خطاء اثناء الرجوع مثل dispose
  @override
  void onClose() {
    // positionStream!.cancel();
    gmc!.dispose();
    //  timer!.cancel();
    super.onClose();
  }
}
