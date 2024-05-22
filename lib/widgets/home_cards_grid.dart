import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/controllers/home_controller.dart';
import 'package:medic/globles/pallets.dart';

class HomeCardsGrid extends StatelessWidget {
  HomeCardsGrid({super.key});

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      shrinkWrap: true,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(
        homeController.imagePaths.length,
        (index) => Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // color: homeController.colors[index % homeController.colors.length],
              color: homeGridColor),
          child: Image.asset(homeController.imagePaths[index]),
        ),
      ),
    );
  }
}
