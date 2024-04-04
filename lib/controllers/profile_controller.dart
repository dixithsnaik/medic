import 'package:get/get.dart';
import 'package:medic/models/profile/user_model.dart';

class ProfileController extends GetxController {
  final currentUser = Rx<UserModel?>(null);

  void updateUser(UserModel user) {
    currentUser.value = user;
    
  }

  Future<void> getUserDetails() async {
    Map<String,dynamic> userMap = {}; //api
    final updatedUser = UserModel.fromMap(userMap);
    updateUser(updatedUser);
  }
}
