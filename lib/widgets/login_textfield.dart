import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';

class LoginTextField extends StatelessWidget {
  final String hintText;
  final String lable;
  final TextEditingController controller;

  const LoginTextField({
    super.key,
    required this.hintText,
    required this.lable,
    required this.controller,
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
            color: whiteColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 50,
          constraints: const BoxConstraints(
            maxWidth: 350,
          ),
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
