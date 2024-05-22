import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/helpers.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:medic/controllers/sign_in_controller.dart';
import 'package:medic/globles/pallets.dart';

class LoginTextField extends StatefulWidget {
  final bool isPhoneNumber;
  final String lable;
  final TextEditingController controller;

  const LoginTextField({
    super.key,
    this.isPhoneNumber = false,
    required this.lable,
    required this.controller,
  });

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  final signInController = Get.find<SignInController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
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
          height: widget.isPhoneNumber ? 80 : 50,
          constraints: const BoxConstraints(
            maxWidth: 350,
          ),
          child: widget.isPhoneNumber
              ? IntlPhoneField(
                  disableLengthCheck: false,
                  initialCountryCode: "IN",
                  controller: widget.controller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
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
                    hintStyle: const TextStyle(
                      color: hintTextColor,
                      fontSize: 16,
                    ),
                    hintText: "Phone Number",
                  ),
                  style: const TextStyle(),
                )
              : TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
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
                    hintStyle: const TextStyle(
                      color: hintTextColor,
                      fontSize: 16,
                    ),
                    hintText: "Email Address",
                  ),
                  style: const TextStyle(),
                ),
        ),
      ],
    );
  }
}
