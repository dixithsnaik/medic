import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/controllers/sign_in_controller.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/widgets/custom_button.dart';
import 'package:medic/widgets/login_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
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
                const SizedBox(height: 36),
                LoginTextField(
                  lable: 'Email Address',
                  controller: signInController.emailController,
                ),
                const SizedBox(height: 12),
                LoginTextField(
                  isPhoneNumber: true,
                  lable: 'Phone Number',
                  controller: signInController.phoneNumberController,
                ),
                const SizedBox(height: 24),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 350,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          signInController.togglePolicyAccepted();
                        },
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.all(4),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: whiteColor,
                            ),
                            child: signInController.policyAccepted.value
                                ? Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "I agree to the privacy policy",
                        style: TextStyle(
                          fontSize: 16,
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                CustomButton(
                  ontap: () {
                    signInController.isSignInFormValid();
                  },
                  lable: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
