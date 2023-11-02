import 'package:dio/dio.dart';
import 'package:voice_app/product/model/lg_model.dart';

class LanguageRepository {
  final String _baseUrl = 'https://api.elevenlabs.io/v1/models';

  final Dio _dio = Dio();

  Future<LanguageModel> getLanguageData() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        return LanguageModel.fromJson(response.data);
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error last $e');
    }
  }
}
