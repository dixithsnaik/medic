import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medic/globles/pallets.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String time;
  final String desc;
  final bool isdesc;
  final Widget child;

  const NotificationCard({
    super.key,
    required this.title,
    required this.time,
    required this.desc,
    this.isdesc = true,
    this.child = const Text(''),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 80,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: textColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Appointment successful',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '25min ago',
                      style: TextStyle(
                        fontSize: 12,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ],
            ),
            isdesc
                ? SizedBox(
                    width: 250,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      desc,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
                  )
                : child,
          ],
        ),
      ),
    );
  }
}
