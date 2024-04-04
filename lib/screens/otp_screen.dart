import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medic/controllers/sign_in_controller.dart';
import 'package:medic/globles/pallets.dart';

import 'package:medic/widgets/back_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: mainColor,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomBackButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Column(
                    children: [
                      const Text(
                        "Enter OTP",
                        style: TextStyle(
                          fontSize: 28,
                          color: whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      const SizedBox(
                        width: 230,
                        child: Text(
                          "Please enter the OTP sent to your Email/Phone number",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: whiteColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            otpFilld(
                                context, 0, signInController.otpControllers[0]),
                            const SizedBox(width: 12),
                            otpFilld(
                                context, 1, signInController.otpControllers[1]),
                            const SizedBox(width: 12),
                            otpFilld(
                                context, 2, signInController.otpControllers[2]),
                            const SizedBox(width: 12),
                            otpFilld(
                                context, 3, signInController.otpControllers[3]),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Didn't get OTP resend",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.content_copy_rounded,
                            color: textColor,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Auto update OTP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ), //sub Column
                  //keypad
                  SizedBox(
                    width: max(220, 350),
                    height: max(300, 400),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            3,
                            (index) => KeyPadButton(
                              text: "${index + 1}",
                              ontap: () {
                                signInController.updateOtpField(index + 1);
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(
                            3,
                            (index) => KeyPadButton(
                              text: "${index + 4}",
                              ontap: () {
                                signInController.updateOtpField(index + 4);
                              },
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              3,
                              (index) => KeyPadButton(
                                text: "${index + 7}",
                                ontap: () {
                                  signInController.updateOtpField(index + 7);
                                },
                              ),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              color: mainColor,
                            ),
                            KeyPadButton(
                              text: '0',
                              ontap: () {
                                signInController.updateOtpField(0);
                              },
                            ),
                            KeyPadButton(
                              text: '<',
                              ontap: () {
                                signInController.backSpace();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ), //main Column
            ),
          ),
        ),
      ),
    );
  }

  SizedBox otpFilld(
      BuildContext context, int index, TextEditingController controller) {
    return SizedBox(
      height: 60,
      width: 45,
      child: TextField(
        controller: controller,
        onChanged: (value) {
          signInController.textFieldOnChanged(index, value);
        },
        enabled: false,
        decoration: InputDecoration(
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: whiteColor,
          filled: true,
          focusColor: whiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: Theme.of(context).textTheme.headlineMedium,
        keyboardType: TextInputType.none,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

class KeyPadButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  const KeyPadButton({super.key, required this.text, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: whiteColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: keypadColor,
            ),
          ),
        ),
      ),
    );
  }
}
