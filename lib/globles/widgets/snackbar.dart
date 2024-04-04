import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/globles/pallets.dart';

Future<void> showCustomSnackBar(
  String message, {
  Color backgroundColor = whiteColor,
  Color snackbarTextColor = textColor,
}) async {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      backgroundColor: Colors.transparent,
      duration: const Duration(seconds: 2),
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            message,
            style: TextStyle(
              color: snackbarTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}
