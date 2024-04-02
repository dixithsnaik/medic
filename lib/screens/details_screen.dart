import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/widgets/custom_textfield.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hii, Avinash",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: textColor,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
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
                        )),
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
              const CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "Add Image",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: keypadColor,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const CustomTextField(
                hintText: "Ex: 123456789012",
                lable: 'Aadhar number',
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: mainColor,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "+91",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: keypadColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: mainColor,
                      ),
                    ),
                    child: Text('data'),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                hintText: "Ex: 123456789012",
                lable: 'Aadhar number',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
