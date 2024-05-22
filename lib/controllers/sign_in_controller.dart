import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/controllers/api_controller.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/globles/widgets/snackbar.dart';
import 'package:medic/models/profile/user_model.dart';
import 'package:medic/screens/details_screen.dart';
import 'package:medic/screens/home_screen.dart';
import 'package:medic/screens/main_screen.dart';
import 'package:medic/screens/otp_screen.dart';
import 'package:permission_handler/permission_handler.dart';

enum Gender { male, female, others }

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
      case Gender.others:
        return "Others";
      default:
        return "";
    }
  }

  String get short {
    switch (this) {
      case Gender.male:
        return "m";
      case Gender.female:
        return "f";
      case Gender.others:
        return "o";
      default:
        return "";
    }
  }
}

class SignInController extends GetxController {
  // name controller, otp controllers, otp verifications, email controller
  // sign in and sign out methods
  final apiController = ApiController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final otpControllers = List.generate(4, (index) => TextEditingController());
  final policyAccepted = false.obs;
  final nameController = TextEditingController();
  final aadharController = TextEditingController();
  final dobController = TextEditingController();
  final professionController = TextEditingController();
  final genderController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final formFilled = false.obs;
  final selectedGender = Rx<Gender?>(null);
  final bloodGroups = ["A+", "B+", "O+", "AB+", "A-", "B-", "O-", "AB-"];
  final selectedbloodGroup = Rx<String?>(null);
  final pickedFile = Rx<XFile?>(null);

  void togglePolicyAccepted() {
    policyAccepted.value = !policyAccepted.value;
  }

  void updateGender(Gender gender) {
    selectedGender.value = gender;
  }

  void updateBloodGroup(String bloodGroup) {
    selectedbloodGroup.value = bloodGroup;
  }

  void isFormValidated() async {
    if (nameController.text.isEmpty ||
        aadharController.text.isEmpty ||
        dobController.text.isEmpty ||
        professionController.text.isEmpty ||
        heightController.text.isEmpty ||
        weightController.text.isEmpty ||
        selectedGender.value == null ||
        selectedbloodGroup.value == null) {
      showCustomSnackBar("Please fill all the fields");
      return;
    }
    await postUserDetails();
  }

  void isSignInFormValid() {
    if (emailController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        phoneNumberController.text.length < 10) {
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

  void updateDate() async {
    final dateTime = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(1947),
        lastDate: DateTime.now().add(const Duration(days: 1)),
        initialDate: DateTime.now());
    if (dateTime == null) return;
    final dateString = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    dobController.text = dateString;
  }

  void getImage() async {
    try {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.camera,
        Permission.storage,
      ].request();
      print("Asked for permission");
      if (statuses[Permission.camera] != PermissionStatus.granted ||
          statuses[Permission.storage] != PermissionStatus.granted) {
        return;
      }
      pickedImage();
    } catch (e) {
      print(e);
    }
  }

  void pickedImage() async {
    final picker = ImagePicker();
    pickedFile.value = await picker.pickImage(
      source: ImageSource.gallery,
    );
    print(pickedFile.value);
  }

  Future<void> postUserDetails() async {
    try {
      final user = UserModel(
        name: nameController.text,
        email: emailController.text,
        aadharNumber: aadharController.text,
        mobileNumber: "",
        userDob: dobController.text,
        profession: professionController.text,
        sex: selectedGender.value!.short,
        bloodGroup: selectedbloodGroup.value!,
        height: heightController.text,
        weight: weightController.text,
        patientId: "123546",
        // profilePicture: pickedFile.value!.toString(),
      );
      await apiController.postUserDetails(user);
      Navigator.of(Get.context!).push(
        MaterialPageRoute(
          builder: (context) =>  MainScreeen(),
        ),
      );
    } catch (e) {
      showCustomSnackBar("Something went wrong");
      print(e);
    }
  }
}
