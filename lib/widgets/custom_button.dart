import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String lable;
  const CustomButton({super.key, required this.lable, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            lable,
            style: const TextStyle(
              fontSize: 20,
              color: mainColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
