import 'package:b_tour/params/register_user_params.dart';
import 'package:b_tour/repo/auth_repository.dart';
import 'package:b_tour/response/register_user_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final authRepository = AuthRepository();
  RegisterUserBloc() : super(RegisterUserInitial()) {
    on<CreateUserEvent>(_registerUser);
  }

  void _registerUser(
      CreateUserEvent event, Emitter<RegisterUserState> emit) async {
    final params = RegisterUserParam(
      event.username,
      event.email,
      event.isActive,
      event.isUser,
      event.firstName,
      event.lastName,
      event.password1,
      event.password2,
    );
    emit(RegisterUserLoading());
    try {
      RegisterUserResponse response = await authRepository.registerUser(params);
      emit(RegisterUserSuccess(registerUserResponse: response));
    } catch (e) {
      emit(RegisterWaitressError(message: e.toString()));
    }
  }
}
