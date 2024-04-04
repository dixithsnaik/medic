import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/globles/widgets/snackbar.dart';
import 'package:medic/screens/details_screen.dart';
import 'package:medic/screens/otp_screen.dart';

class SignInController extends GetxController {
  // name controller, otp controllers, otp verifications, email controller
  // sign in and sign out methods
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final otpControllers = List.generate(4, (index) => TextEditingController());
  final policyAccepted = false.obs;

  void togglePolicyAccepted() {
    policyAccepted.value = !policyAccepted.value;
  }

  void isFormValid() {
    if (emailController.text.isEmpty || nameController.text.isEmpty) {
      showCustomSnackBar("Please fill details");
    } else if (!emailController.text.isEmail) {
      showCustomSnackBar("Please enter a valid email!");
    } else if (!policyAccepted.value) {
      showCustomSnackBar("Please accept the policy");
    } else {
      // sign in logic
      Navigator.of(Get.context!).push(
        MaterialPageRoute(
          builder: (context) => const OtpScreen(),
        ),
      );
    }
  }

  var currentIndex = 0;
  String serverOtp = "1234";

  void textFieldOnChanged(
    index,
    value,
  ) {
    if (index != 3) {
      if (value.length == 1) {
        index++;

        FocusScope.of(Get.context!).nextFocus();
      }
    } else if (index == 3) {
      verifyOtp();
    }
  }

  void updateOtpField(int num) {
    if (currentIndex < 4) {
      otpControllers[currentIndex].text = num.toString();
      currentIndex++;
      if (currentIndex == 4) {
        verifyOtp();
      }
    }
  }

  void backSpace() {
    if (currentIndex > 0) {
      currentIndex--;
      otpControllers[currentIndex].text = '';
    }
  }

  void resetOtpControllers() {
    for (var e in otpControllers) {
      e.text = '';
    }
    currentIndex = 0;
  }

  void verifyOtp() {
    if (otpControllers.any((controller) => controller.text.isEmpty)) {
      return;
    }
    final userOtp = otpControllers.map((e) => e.text).join();
    if (userOtp == serverOtp) {
      Navigator.of(Get.context!).push(
        MaterialPageRoute(
          builder: (context) => const DetailsScreen(),
        ),
      );
    } else {
      resetOtpControllers();
      showCustomSnackBar('Wrong OTP! Please try again.',
          backgroundColor: const Color.fromARGB(255, 181, 69, 69),
          snackbarTextColor: whiteColor);
    }
  }
}
