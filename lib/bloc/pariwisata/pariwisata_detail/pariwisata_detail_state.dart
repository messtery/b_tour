part of 'pariwisata_detail_bloc.dart';

@immutable
abstract class PariwisataDetailState {}

class PariwisataDetailInitial extends PariwisataDetailState {}

class PariwisataDetailLoading extends PariwisataDetailState {}

class PariwisataDetailLoaded extends PariwisataDetailState {
  final PariwisataDetailResponse pariwisataDetailResponse;
  PariwisataDetailLoaded({required this.pariwisataDetailResponse});
}

class PariwisataDetailError extends PariwisataDetailState {
  final String message;
  PariwisataDetailError({required this.message});
}
