import 'package:e_commerce/controller/notification_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
   Get.put(NotificationController());
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: GetBuilder<NotificationController>(
            builder: (controllernot) => HandingDataView(
                statusRequest: controllernot.statusRequest,
                widget: ListView(
                  children: [
                    const Center(
                      child: Text(
                        "Notification",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...List.generate(
                      controllernot.data.length,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Stack(
                          children: [
                            ListTile(
                              title: Text(
                                "${controllernot.data[index].notificationTitle}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                  "${controllernot.data[index].notificationBody}"),
                              trailing: IconButton(
                                  onPressed: () {
                                    controllernot.deleteNotification(controllernot
                                        .data[index].notificationId
                                        .toString());
                                   
                                  },
                                  icon: const Icon(Icons.disabled_by_default_outlined,color: Colors.red,)),
                            ),
                            Positioned(
                              right: 90,
                              child: Text(
                                Jiffy.parse(
                                        "${controllernot.data[index].notificationDatetime}")
                                    .fromNow(),
                                style: const TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
