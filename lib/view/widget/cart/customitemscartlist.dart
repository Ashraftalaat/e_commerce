import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: imagename,
                height: 80,
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                subtitle: Text(
                  "$price \$",
                  style: const TextStyle(color: AppColor.primaryColor),
                ),
              ),
            ),
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child: IconButton(
                    onPressed: onAdd,
                    icon: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: Text(
                    count,
                    style: const TextStyle(fontFamily: "sans"),
                  ),
                ),
                SizedBox(
                  height: 30,
                  child: IconButton(
                    onPressed: onRemove,
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
