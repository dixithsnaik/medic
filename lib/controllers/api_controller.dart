import 'package:dio/dio.dart';
import 'package:medic/globles/apis.dart';
import 'package:medic/globles/pallets.dart';
import 'package:medic/globles/widgets/snackbar.dart';
import 'package:medic/models/profile/user_model.dart';

class ApiController {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
    ),
  );

  Future<void> postUserDetails(UserModel userModel) async {
    final res = await dio.post(
      postPatientDetails,
      data: userModel.toMap(),
    );
    print("User details posted: ${res.data}");
    await showCustomSnackBar(res.data['message'],
        backgroundColor: mainColor, snackbarTextColor: whiteColor);
  }
}
