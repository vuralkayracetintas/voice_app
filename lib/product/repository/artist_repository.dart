import 'package:dio/dio.dart';
import 'package:voice_app/product/model/artist_model.dart';

class ArtistRepository {
  final String _baseUrl = 'https://api.elevenlabs.io/v1/voices';

  final Dio _dio = Dio();

  Future<ArtistModel> getArtistData() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        return ArtistModel.fromJson(response.data);
      } else {
        throw Exception('Error ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error last ${e}');
    }
  }
}
