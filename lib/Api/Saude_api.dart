import 'package:dio/dio.dart';
import 'package:infoclin_913/domain/Saude.dart';

class SaudeApi {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://my-json-server.typicode.com/leticiavital/fake-api-saude',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {'Accept': 'application/json'},
    ),
  );

  Future<List<ArtigoSaude>> listarArtigos() async {
    final response = await _dio.get('/artigos');

    if (response.statusCode == 200) {
      final dynamic jsonData = response.data;

      if (jsonData is List) {
        return jsonData.map((e) => ArtigoSaude.fromJson(e)).toList();
      }
    }

    //listavazia (caso erro)
    return [];
  }

  //busca id
  Future<ArtigoSaude?> buscarArtigoPorId(String id) async {
    final response = await _dio.get('/artigos/$id');

    if (response.statusCode == 200) {
      return ArtigoSaude.fromJson(response.data);
    }

    return null;
  }
}
