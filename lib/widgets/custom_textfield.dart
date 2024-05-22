import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medic/globles/pallets.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String lable;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: mainColor,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: mainColor,
            ),
          ),
          width: 350,
          height: 50,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              fillColor: whiteColor,
              filled: true,
              disabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: whiteColor,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: whiteColor,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: whiteColor,
                ),
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: hintTextColor,
                fontSize: 16,
              ),
            ),
            style: const TextStyle(),
          ),
        ),
      ],
    );
  }
}
