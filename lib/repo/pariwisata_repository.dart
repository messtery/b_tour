import 'package:b_tour/core/api_client.dart';
import 'package:b_tour/core/session_manager.dart';
import 'package:b_tour/params/pariwisata_detail_params.dart';
import 'package:b_tour/response/pariwisata_response.dart';
import 'package:dio/dio.dart';

class PariwisataRepository extends ApiClient {
  final sessionManager = SessionManager();
  Future<PariwisataResponse> getAllPariwisata() async {
    try {
      Options _options = Options(headers: {
        'Authorization': 'Token ${sessionManager.getActiveToken()}'
      });
      final response = await dio.get(
        'pariwisata',
        options: _options,
      );

      // debugPrint('Hasil Response: ${response.data['data']}');
      return PariwisataResponse.fromJson(response.data['data']);
    } on DioError catch (e) {
      throw e.toString();
    }
  }

  Future<PariwisataDetailResponse> getPariwisataDetail(
      PariwisataDetailParam param) async {
    try {
      Options _options = Options(headers: {
        'Authorization': 'Token ${sessionManager.getActiveToken()}'
      });
      final response = await dio.get(
        'pariwisata/${param.toJson()['id']}',
        options: _options,
      );
      // debugPrint('Hasil Response: ${response.data['data']}');
      return PariwisataDetailResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
