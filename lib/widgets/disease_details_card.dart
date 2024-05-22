import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';

class DiseaseDetailsCard extends StatelessWidget {
  const DiseaseDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 175, 175, 175),
              offset: Offset(
                5.0,
                2.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          color: whiteColor,
          border: const Border(
            left: BorderSide(
              color: Colors.amberAccent,
              width: 3.0,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      color: hintTextColor,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "2 Months Ago",
                      style: TextStyle(
                        color: hintTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "2 Months Ago",
                  style: TextStyle(
                    color: hintTextColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [],
            )
          ],
        ));
  }
}
