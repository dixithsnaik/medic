import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback ontap;
  final String lable;
  final Color fillColor;
  final Color textColor;
  const CustomButton({
    super.key,
    required this.lable,
    required this.ontap,
    this.fillColor = whiteColor,
    this.textColor = mainColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            lable,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
