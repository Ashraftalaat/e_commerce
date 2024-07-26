import 'package:e_commerce/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

class Logoregister extends StatelessWidget {
  const Logoregister({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
              margin: const EdgeInsets.only(bottom:10),
              child: Image.asset(
                AppImageAsset.logo,
                width: 160,
                height: 350,
              ),
            );
  }
}