import 'package:e_commerce/controller/auth/forgetpassword/settings_controller.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 3,
                color: AppColor.primaryColor,
              ),
              Positioned(
                top: Get.width / 3.9,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: const AssetImage(AppImageAsset.avatar),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Card(
            child: Column(
              children: [
                ListTile(
                  title: const Text("Disable Notification"),
                  trailing: Switch(value: true, onChanged: (val) {}),
                ),
                const Divider(),
                ListTile(
                  title: const Text("Orders"),
                  trailing: const Icon(Icons.card_travel),
                  onTap: () {
                    Get.toNamed(AppNamesRouts.pendingorder);
                  },
                ),
                 const Divider(),
                ListTile(
                  title: const Text("Archive"),
                  trailing: const Icon(Icons.card_travel),
                  onTap: () {
                    Get.toNamed(AppNamesRouts.archiveorder);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("Address"),
                  trailing: const Icon(Icons.location_on_outlined),
                  onTap: () {
                    Get.toNamed(AppNamesRouts.addressview);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("About us"),
                  trailing: const Icon(Icons.help_outline_rounded),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: const Text("Contact us"),
                  trailing: const Icon(Icons.phone_callback_outlined),
                  onTap: () async{
                    launchUrl(Uri.parse("tel:01122449170"));
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("Logout"),
                  trailing: const Icon(Icons.exit_to_app),
                  onTap: () {
                    controller.logout();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
