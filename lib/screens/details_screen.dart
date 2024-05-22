import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medic/controllers/sign_in_controller.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/screens/home_screen.dart';
import 'package:medic/screens/main_screen.dart';
import 'package:medic/widgets/custom_button.dart';
import 'package:medic/widgets/custom_textfield.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final signInController = Get.find<SignInController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Nmaste",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(Get.context!).push(
                          MaterialPageRoute(
                            builder: (context) =>  MainScreeen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: textColor,
                        ),
                        child: const Center(
                          child: Text(
                            'Skip>',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "We want to offer the best service in everything we do. It would really help us if you could give us the right information about yourself. Don't worry, your details are kept private and will help us give you the right kind of help.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: keypadColor,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Obx(
                  () => InkWell(
                    onTap: signInController.getImage,
                    child: signInController.pickedFile.value == null
                        ? const Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Add Image",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w200,
                                  color: keypadColor,
                                ),
                              ),
                              SizedBox(height: 24)
                            ],
                          )
                        : Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundImage: FileImage(
                                  File(signInController.pickedFile.value!.path),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),

                //aadhar text field
                CustomTextField(
                  controller: signInController.nameController,
                  hintText: "Full Name",
                  lable: 'Name',
                ),
                const SizedBox(
                  height: 16,
                ),

                //mobile number
                CustomTextField(
                  controller: signInController.aadharController,
                  hintText: "Aadhar Number",
                  lable: 'Aadhar Number',
                ),
                const SizedBox(height: 16),

                //date of birth
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Date Of Birth",
                      style: TextStyle(
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
                      height: 50,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              signInController.updateDate();
                            },
                            icon: const Icon(CupertinoIcons.calendar),
                            color: textColor,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: signInController.dobController,
                              enabled: false,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                fillColor: whiteColor,
                                filled: true,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: "DD/MM/YYYY",
                                hintStyle: TextStyle(
                                  color: hintTextColor,
                                  fontSize: 16,
                                ),
                              ),
                              style: const TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                //profession
                CustomTextField(
                  controller: signInController.professionController,
                  hintText: "Profession",
                  lable: 'Profession',
                ),
                const SizedBox(height: 16),

                //gender and bloodgroup
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
                            value: signInController.selectedGender.value,
                            items: Gender.values
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Text(e.name),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (gender) {
                              if (gender == null) return;
                              signInController.updateGender(gender);
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              hintStyle: const TextStyle(
                                color: hintTextColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Blood Group",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          DropdownButtonFormField(
                            value: signInController.selectedbloodGroup.value,
                            items: signInController.bloodGroups
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      children: [
                                        Text(e),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (val) {
                              if (val == null) return;
                              signInController.updateBloodGroup(val);
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: mainColor),
                              ),
                              hintStyle: const TextStyle(
                                color: hintTextColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                //height and weight
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Height",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: mainColor),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: signInController.heightController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffix: const Text(
                                    'm',
                                    style: TextStyle(color: textColor),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  fillColor: whiteColor,
                                  filled: true,
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: whiteColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: whiteColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: whiteColor,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: hintTextColor,
                                    fontSize: 16,
                                  ),
                                  hintText: "In Meters",
                                ),
                                style: const TextStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: mainColor),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: signInController.weightController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffix: const Text(
                                    'Kg',
                                    style: TextStyle(color: textColor),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 15),
                                  fillColor: whiteColor,
                                  filled: true,
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: whiteColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: whiteColor,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: whiteColor,
                                    ),
                                  ),
                                  hintStyle: const TextStyle(
                                    color: hintTextColor,
                                    fontSize: 16,
                                  ),
                                  hintText: "In Kg",
                                ),
                                style: const TextStyle(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                //submit button
                CustomButton(
                  lable: "Submit",
                  ontap: () {
                    signInController.isFormValidated();
                  },
                  fillColor: mainColor,
                  textColor: whiteColor,
                ),
                const SizedBox(height: 65),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
