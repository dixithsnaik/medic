import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Icon(
            CupertinoIcons.back,
            color: textColor,
            size: 35,
          ),
        ),
      ),
    );
  }
}
