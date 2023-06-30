part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileUserResponse listProfileModel;
  ProfileLoaded({required this.listProfileModel});
}

class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});
}
