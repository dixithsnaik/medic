import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/screens/otp_screen.dart';
import 'package:medic/widgets/custom_button.dart';
import 'package:medic/widgets/login_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: mainColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins",
                        letterSpacing: 2,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Welcome'),
                        TextSpan(
                          text: '\nGlad to see you!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Poppins",
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  const LoginTextField(
                    hintText: 'medic@domain.com',
                    lable: 'Email Address',
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const LoginTextField(
                    hintText: 'Full Name',
                    lable: 'Name',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: whiteColor,
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        "I agree to the privacy policy",
                        style: TextStyle(
                          fontSize: 16,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 36,
                  ),
                  CustomButton(
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ),
                      );
                    },
                    lable: 'Submit',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
