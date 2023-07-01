import 'package:b_tour/models/pariwisata_model.dart';
import 'package:b_tour/repo/pariwisata_repository.dart';
import 'package:b_tour/response/pariwisata_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pariwisata_list_event.dart';
part 'pariwisata_list_state.dart';

class PariwisataListBloc
    extends Bloc<PariwisataListEvent, PariwisataListState> {
  final pariwisataRepository = PariwisataRepository();
  PariwisataListBloc() : super(PariwisataListInitial()) {
    on<PariwisataListEvent>((event, emit) async {
      emit(PariwisataListLoading());
      try {
        PariwisataResponse response =
            await pariwisataRepository.getAllPariwisata();
        emit(PariwisataListLoaded(
            listPariwisataListModel: response.listPariwisata));
      } catch (e) {
        emit(PariwisataListError(message: e.toString()));
      }
    });
  }
}
