import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medic/controllers/home_controller.dart';
import 'package:medic/controllers/sign_in_controller.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/widgets/home_cards_grid.dart';
import 'package:medic/widgets/notification_section.dart';
import 'package:medic/widgets/upcoming_appointment_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final SignInController signInController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBar(),
                Obx(
                  () => Column(
                    children: [
                      if (signInController.formFilled.value &&
                          homeController.isInfoUpdated.value == false)
                        const Text(
                          "Update your information for better experience",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: redColor,
                          ),
                        ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
                Obx(
                  () => homeController.isNotification.value
                      ? const NotificationSection()
                      : Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: mainColor)),
                          child: const Center(
                            child: Text(
                              "No Notification At",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 138, 138, 138),
                              ),
                            ),
                          ),
                        ),
                ),
                Obx(
                  () => homeController.isAppointment.value
                      ? Column(
                          children: [
                            SizedBox(height: 20),
                            Text(
                              "Upcoming Appointment",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: textColor,
                              ),
                            ),
                            SizedBox(height: 10),
                            UpcomingAppointCard(),
                          ],
                        )
                      : SizedBox(),
                ),
                SizedBox(height: 18),
                const Text(
                  "Explore Services",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 18),
                HomeCardsGrid(),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning",
                      style: TextStyle(
                          fontSize: 20,
                          color: textColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Avinash",
                      style: TextStyle(
                        fontSize: 16,
                        color: mainColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: mainColor),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
