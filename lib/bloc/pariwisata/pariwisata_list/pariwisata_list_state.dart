part of 'pariwisata_list_bloc.dart';

@immutable
abstract class PariwisataListState {}

class PariwisataListInitial extends PariwisataListState {}

class PariwisataListLoading extends PariwisataListState {}

class PariwisataListLoaded extends PariwisataListState {
  final List<PariwisataModel> listPariwisataListModel;
  PariwisataListLoaded({required this.listPariwisataListModel});
}

class PariwisataListError extends PariwisataListState {
  final String message;
  PariwisataListError({required this.message});
}
