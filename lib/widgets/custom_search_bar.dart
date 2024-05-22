import 'package:flutter/material.dart';
import 'package:medic/globles/pallets.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: mainColor,
        ),
      ),
      width: 350,
      height: 55,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          fillColor: whiteColor,
          filled: true,
          disabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: whiteColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: whiteColor,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: whiteColor,
            ),
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(0.0),
            child: Icon(
              Icons.search,
              color: Colors.grey,
            ), // icon is 48px widget.
          ),
          hintText: "Search",
          hintStyle: const TextStyle(
            color: hintTextColor,
            fontSize: 16,
          ),
        ),
        style: const TextStyle(),
      ),
    );
  }
}
