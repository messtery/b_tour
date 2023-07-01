import 'package:b_tour/params/pariwisata_detail_params.dart';
import 'package:b_tour/repo/pariwisata_repository.dart';
import 'package:b_tour/response/pariwisata_response.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pariwisata_detail_event.dart';
part 'pariwisata_detail_state.dart';

class PariwisataDetailBloc
    extends Bloc<PariwisataDetailEvent, PariwisataDetailState> {
  final pariwisataRepository = PariwisataRepository();
  PariwisataDetailBloc() : super(PariwisataDetailInitial()) {
    on<GetDetailPariwisataEvent>(_getDetailPariwisata);
  }

  void _getDetailPariwisata(GetDetailPariwisataEvent event,
      Emitter<PariwisataDetailState> emit) async {
    final params = PariwisataDetailParam(event.id);
    emit(PariwisataDetailLoading());
    try {
      PariwisataDetailResponse response =
          await pariwisataRepository.getPariwisataDetail(params);
      emit(PariwisataDetailLoaded(pariwisataDetailResponse: response));
    } catch (e) {
      emit(PariwisataDetailError(message: e.toString()));
    }
  }
}
