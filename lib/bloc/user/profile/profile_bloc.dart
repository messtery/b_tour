import 'package:b_tour/models/profile_model.dart';
import 'package:b_tour/repo/auth_repository.dart';
import 'package:b_tour/response/profile_user_resopnse.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final authRepository = AuthRepository();
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      try {
        ProfileUserResponse response = await authRepository.getProfile();
        emit(ProfileLoaded(listProfileModel: response));
      } catch (e) {
        emit(ProfileError(message: e.toString()));
      }
    });
  }
}
