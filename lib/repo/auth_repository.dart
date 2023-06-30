import 'package:b_tour/core/api_client.dart';
import 'package:b_tour/core/session_manager.dart';
import 'package:b_tour/params/login_user_params.dart';
import 'package:b_tour/params/register_user_params.dart';
import 'package:b_tour/response/login_user_response.dart';
import 'package:b_tour/response/profile_user_resopnse.dart';
import 'package:b_tour/response/register_user_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AuthRepository extends ApiClient {
  final sessionManager = SessionManager();
  Future<RegisterUserResponse> registerUser(RegisterUserParam param) async {
    try {
      print(param);
      final response = await dio.post('v1/register', data: param.toJson());
      debugPrint("POST Register: ${response.data}");
      return RegisterUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginUserResponse> loginUser(LoginUserParam param) async {
    try {
      print(param);
      final response = await dio.post('v1/login', data: param.toJson());
      debugPrint("POST Register: ${response.data}");
      return LoginUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<ProfileUserResponse> getProfile() async {
    try {
      Options _options = Options(headers: {
        'Authorization': 'Token ${sessionManager.getActiveToken()}'
      });
      final response = await dio.get(
        "v1/profile/${sessionManager.getActiveId()}",
        options: _options,
      );
      debugPrint("POST Register: ${response.data}");
      return ProfileUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
