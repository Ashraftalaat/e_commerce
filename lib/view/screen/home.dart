// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/home_controller.dart';
import 'package:e_commerce/core/class/handingdataview.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:e_commerce/core/constant/routs.dart';
import 'package:e_commerce/data/model/items.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:e_commerce/view/widget/customappbar.dart';
import 'package:e_commerce/view/widget/home/customcardhome.dart';
import 'package:e_commerce/view/widget/home/customtitlehome.dart';
import 'package:e_commerce/view/widget/home/listcategorieshome.dart';
import 'package:e_commerce/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  get colorsgr => null;

  @override
  Widget build(BuildContext context) {
  Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView(
          children: [
            CustomAppBar(
              myController: controller.search,
              titleAppBar: "Find Product",
              //  onPressedIcon: () {},
              onPressedSearch: () {
                controller.onSearchItems();
              },
              onPressedIconFav: () {
                Get.toNamed(AppNamesRouts.myfavorite);
              },
              //ويمكن البحث من خلال كل حرف يتكتيب يتعمل لية ريكويست
              // وهذا تكلفة اعلي للسيرفير
              //ويتم من خلال  onCanged
              onChanged: (val) {
                controller.checkSearch(val);
              },
            ),
            HandingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ?  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      if(controller.settingsData.isNotEmpty)    CustomCardHome(
                              title: "${controller.settingsData[0]["settings_titlehome"]}",
                              body: "${controller.settingsData[0]["settings_bodyhome"]}"),
                          const CustomTitleHome(title: "Categories :"),
                          const ListCategories(),
                          const CustomTitleHome(title: "Top Selling :"),
                          const ListItemsHome(),
                        ],
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata)),
          ],
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<Itemsmodel> listdatamodel;
  const ListItemsSearch({
    super.key,
    required this.listdatamodel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listdatamodel.length,
      itemBuilder: (context, index) {
        return
            //Text("${listdatamodel[index].itemsName}");
            InkWell(
          onTap: () {
            controller.gotoPageItemsDetails(listdatamodel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLinkApi.imagestitems}/${listdatamodel[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                          "${listdatamodel[index].itemsName}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text(
                          "${listdatamodel[index].categoriesName}",
                          style: const TextStyle(
                              fontSize: 15, color: AppColor.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
