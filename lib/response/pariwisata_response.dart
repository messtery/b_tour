import 'package:b_tour/models/pariwisata_model.dart';

class PariwisataResponse {
  List<PariwisataModel> listPariwisata = [];

  PariwisataResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      PariwisataModel pariwisataResponse = PariwisataModel.fromJson(json[i]);
      listPariwisata.add(pariwisataResponse);
    }
  }
}

class PariwisataDetailResponse {
  final PariwisataModel? pariwisataModel;

  PariwisataDetailResponse({required this.pariwisataModel});

  factory PariwisataDetailResponse.fromJson(Map<String, dynamic> json) {
    return PariwisataDetailResponse(
      pariwisataModel: PariwisataModel.fromJson(json["data"]),
    );
  }
}
