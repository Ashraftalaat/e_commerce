import 'package:e_commerce/controller/homescreen_controller.dart';

import 'package:e_commerce/view/widget/homescreen/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: ((controller) => BottomAppBar(
          
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomButtonAppBar(
                            onPressed: () {
                              controller.changePage(i);
                            },
                            //عملناه لست ليها
                            textButton: controller.titleBottonAppBar[i],
                            //عملناه لست ليها
                            iconData: controller.icondata[i],
                            active: controller.currentpage == i ? true : false);
                  }),

        //=================== تم استبالهم بال ...List.generate =====================

                  // Row(
                  //   children: [
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(0);
                  //         },
                  //         textButton: "HOME",
                  //         iconData: Icons.home,
                  //         active: controller.currentpage == 0 ? true : false),
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(1);
                  //         },
                  //         textButton: "Setting",
                  //         iconData: Icons.settings,
                  //         active: controller.currentpage == 1 ? true : false),
                  //   ],
                  // ),
                  // const Spacer(),
                  // Row(
                  //   children: [
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(2);
                  //         },
                  //         textButton: "Perofile",
                  //         iconData: Icons.person,
                  //         active: controller.currentpage == 2 ? true : false),
                  //     CustomButtonAppBar(
                  //         onPressed: () {
                  //           controller.changePage(3);
                  //         },
                  //         textButton: "Favorite",
                  //         iconData: Icons.favorite,
                  //         active: controller.currentpage == 3 ? true : false),
                  //   ],
                  // ),
                ],
              ),
            )));
  }
}
