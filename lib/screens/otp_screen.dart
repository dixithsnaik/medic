import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/screens/details_screen.dart';
import 'package:medic/screens/login.dart';
import 'package:medic/widgets/back_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: size.width,
            height: size.height,
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
                            otpFilld(context, 0),
                            const SizedBox(
                              width: 12,
                            ),
                            otpFilld(context, 1),
                            const SizedBox(
                              width: 12,
                            ),
                            otpFilld(context, 2),
                            const SizedBox(
                              width: 12,
                            ),
                            otpFilld(context, 3),
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
                          children: [
                            KeyPadButton(
                              text: '1',
                              ontap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const DetailsScreen(),
                                  ),
                                );
                              },
                            ),
                            KeyPadButton(
                              text: '2',
                              ontap: () {},
                            ),
                            KeyPadButton(
                              text: '3',
                              ontap: () {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            KeyPadButton(
                              text: '4',
                              ontap: () {},
                            ),
                            KeyPadButton(
                              text: '5',
                              ontap: () {},
                            ),
                            KeyPadButton(
                              text: '6',
                              ontap: () {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            KeyPadButton(
                              text: '7',
                              ontap: () {},
                            ),
                            KeyPadButton(
                              text: '8',
                              ontap: () {},
                            ),
                            KeyPadButton(
                              text: '9',
                              ontap: () {},
                            ),
                          ],
                        ),
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
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const DetailsScreen(),
                                  ),
                                );
                              },
                            ),
                            KeyPadButton(
                              text: '<',
                              ontap: () {},
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

  SizedBox otpFilld(BuildContext context, int index) {
    return SizedBox(
      height: 60,
      width: 45,
      child: TextField(
        onChanged: (
          value,
        ) {
          if (index != 3) {
            if (value.length == 1) {
              index++;

              FocusScope.of(context).nextFocus();
            }
          } else if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DetailsScreen(),
              ),
            );
          }
        },
        decoration: InputDecoration(
          disabledBorder: InputBorder.none,
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
