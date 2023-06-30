import 'package:b_tour/models/user_model.dart';
import 'package:b_tour/models/profile_model.dart';

class ProfileUserResponse {
  final ProfileModel? profileModel;
  final String? message;

  ProfileUserResponse({required this.profileModel, this.message});

  factory ProfileUserResponse.fromJson(Map<String, dynamic> json) {
    return ProfileUserResponse(
      profileModel: ProfileModel.fromJson(json),
    );
  }
}
