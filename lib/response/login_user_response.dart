import 'package:b_tour/models/user_login_model.dart';
import 'package:b_tour/models/user_model.dart';

class LoginUserResponse {
  final UserLoginModel? userLoginModel;
  final String message;

  LoginUserResponse({required this.userLoginModel, required this.message});

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    return LoginUserResponse(
      userLoginModel: UserLoginModel.fromJson(json["data"]),
      message: "Berhasil menambahkan Data User",
    );
  }
}
