import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/globles/assets.dart';

class HomeController extends GetxController {
  final imagePaths = [
    appoint,
    hospital,
    drugs,
    lab,
  ];
  final navbarSelectedIndex = 0.obs;
  final isInfoUpdated = false.obs;
  final isNotification = false.obs;
  final isAppointment = false.obs;
  

  final colors = [Colors.red, Colors.blue, Colors.yellow];
}
