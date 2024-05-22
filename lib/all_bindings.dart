import 'package:get/get.dart';
import 'package:medic/controllers/home_controller.dart';
import 'package:medic/controllers/navigation_controller.dart';
import 'package:medic/controllers/profile_controller.dart';
import 'package:medic/controllers/sign_in_controller.dart';

class AllBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NavigationController>(() => NavigationController());
    Get.lazyPut<SignInController>(() => SignInController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}