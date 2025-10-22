import 'package:dio/dio.dart';
import 'package:infoclin_913/Place.dart';

class PropertiesApi {
  final dio = Dio();
  String url = 'https://api.geoapify.com/v2/places?categories=healthcare.hospital&filter=place:514f20ec14ab5442c05984b9ddcb7d8223c0f00101f901c2a2040000000000c00208&limit=20&apiKey=07f243df0f3446c49091adafd23d04e0';

  Future<List<String>> findHospitalsByCity(String city) async {
    try {
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
        // Verificação case-insensitive
        if (props['city'] != null &&
            props['city'].toString().toLowerCase() == city.toLowerCase()) {
          // Adiciona o nome a lista se existir
          if (props['name'] != null) {
            hospitalNames.add(props['name']);
          }
        }
      }

      // Retorna a lista de nomes
      return hospitalNames;
    } catch (e) {
      print('Erro ao buscar hospitais: $e');
      return [];
    }
  }
}