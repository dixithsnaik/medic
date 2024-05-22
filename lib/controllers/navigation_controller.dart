import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medic/screens/details_screen.dart';
import 'package:medic/screens/main_screen.dart';
import 'package:medic/screens/home_screen.dart';
import 'package:medic/screens/login_screen.dart';
import 'package:medic/screens/otp_screen.dart';

class NavigationController extends GetxController {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case '/otp':
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case '/details':
        return MaterialPageRoute(builder: (_) => const DetailsScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => MainScreeen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
