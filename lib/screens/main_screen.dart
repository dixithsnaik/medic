import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medic/controllers/home_controller.dart';
import 'package:medic/screens/appointment_screen.dart';
import 'package:medic/screens/document_screen.dart';
import 'package:medic/screens/home_screen.dart';
import 'package:medic/screens/profile_screen.dart';

class MainScreeen extends StatelessWidget {
  MainScreeen({super.key});
  final tabs = [
    HomeScreen(),
    const DocumentScreen(),
    const AppointmentScreen(),
    const ProfileScreen(),
  ];
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
          () => tabs[homeController.navbarSelectedIndex.value],
        ),
        bottomNavigationBar: Obx(
          () => NavigationBar(
            selectedIndex: homeController.navbarSelectedIndex.value,
            onDestinationSelected: (index) =>
                homeController.navbarSelectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(
                  icon: Icon(Icons.document_scanner), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.calendar_month_rounded), label: "Home"),
              NavigationDestination(icon: Icon(Icons.person), label: "Home"),
            ],
          ),
        ));
  }
}
