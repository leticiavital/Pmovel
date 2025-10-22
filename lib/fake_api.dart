import 'package:dio/dio.dart';

class ClinicasApi {
  final dio = Dio();
  String url = 'https://my-json-server.typicode.com/mklara912/api_fake/features';

  Future<List<String>> findClinicasByCity(String city) async {
    // Busca a resposta vinda da api
    final response = await dio.get(url);

    // Busca o features e cria uma lista de nomes de hospitais
    final List features = response.data['features'];
    List<String> hospitalNames = [];

    // Busca um feature por vez
    for (var feature in features) {
      // Pega o properties que contem o nome do hospital e a cidade
      final props = feature['properties'];
      // Verifique se a cidade vinda da api é igual a cidade digitada
      // Coloque uma verificação maiuscula e minuscula
      if (props['city'] == city) {
        // Adiciona o nome a lista
        hospitalNames.add(props['name']);
      }
    }

    // Retorna a lista de nomes
    return hospitalNames;
  }
}