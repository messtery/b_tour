import 'package:b_tour/models/user_model.dart';

class RegisterUserResponse {
  final UserModel? userModel;
  final String message;

  RegisterUserResponse({required this.userModel, required this.message});

  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisterUserResponse(
      userModel: UserModel.fromJson(json),
      message: "Berhasil menambahkan Data User",
    );
  }
}
