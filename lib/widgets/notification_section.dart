import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/widgets/notification_card.dart';

class NotificationSection extends StatelessWidget {
  const NotificationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      child: Scrollbar(
        trackVisibility: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              NotificationCard(
                isdesc: false,
                title: "Appointment successful",
                time: "25min ago",
                desc: 'Inspirational designs, and search results',
                child: Container(
                  height: 30,
                  width: 220,
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Show QR To Medical Shop",
                      style: TextStyle(
                        fontSize: 14,
                        color: whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const NotificationCard(
                title: "newnotify",
                time: "25min ago",
                desc: 'Inspirational designs, and search results',
              ),
             const  NotificationCard(
                title: "newnotify",
                time: "25min ago",
                desc: 'Inspirational designs, and search results',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
