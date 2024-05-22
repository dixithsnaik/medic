import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/widgets/custom_search_bar.dart';
import 'package:medic/widgets/disease_card.dart';

class DocumentScreen extends StatelessWidget {
  const DocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 15),
      child: const SafeArea(
        child: Column(
          children: [
            AppBar(),
            SizedBox(height: 26),
            CustomSearchBar(),
            SizedBox(height: 26),
            DiseaseCard(
              diseaseName: "Common Cold",
            ),
            DiseaseCard(
              diseaseName: "Common Cold",
            ),
            DiseaseCard(
              diseaseName: "Common Cold",
            ),
            DiseaseCard(
              diseaseName: "Common Cold",
            ),
            DiseaseCard(
              diseaseName: "Common Cold",
            ),
            DiseaseCard(
              diseaseName: "Common Cold",
            ),
          ],
        ),
      ),
    ));
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
            const SizedBox(width: 16),
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hii Avinash!",
                      style: TextStyle(
                          fontSize: 20,
                          color: textColor,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "review your reports.",
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
          ],
        ),
      ],
    );
  }
}
