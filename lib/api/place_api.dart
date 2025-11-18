import 'package:dio/dio.dart';
import 'package:infoclin_913/domain/Place.dart';

class PropertiesApi {
  //CONECTA API CM DART
  final dio = Dio();

  final String apiKey = '07f243df0f3446c49091adafd23d04e0';

  // Coordenadas de Arapiraca-AL
  final double latitude = -9.754; // lat
  final double longitude = -36.661; // lon

  Future<List<Properties>> findHospitalsByCity(String city) async {
    try {
      // LINK DA API REAL COM A LOC.
      final String url =
          'https://api.geoapify.com/v2/places?'
          'categories=healthcare.hospital&'
          'filter=circle:$longitude,$latitude,10000&'
          'bias=proximity:$longitude,$latitude&'
          'limit=20&'
          'apiKey=$apiKey';

      print('Buscando hospitais em Arapiraca...');
      print('URL: $url');

      final response = await dio.get(url);

      if (response.statusCode == 200 && response.data != null) {
        final data = response.data;

        if (data['features'] != null && data['features'] is List) {
          final List features = data['features'];
          List<Properties> hospitals = [];

          print('Total de features encontradas: ${features.length}');

          for (var feature in features) {
            try {
              if (feature['properties'] != null) {
                final props = Properties.fromJson(feature['properties']);

                final cidade = (props.city ?? '').toLowerCase().trim();
                final municipio = (props.municipality ?? '').toLowerCase().trim();
                final county = (props.county ?? '').toLowerCase().trim();
                final formatted = (props.formatted ?? '').toLowerCase();
//FILTO IMPORTANTE P ACEITAR E IDENTIFICAR ARAP PELA API
                bool isArapiraca = cidade == 'arapiraca' ||
                    municipio == 'arapiraca' ||
                    county == 'arapiraca' ||
                    formatted.contains('arapiraca');

                if (isArapiraca) {
                  hospitals.add(props);
                  print('✓ ${props.name} — ACEITO');
                } else {
                  print('✗ ${props.name} — REJEITADO');
                }
              }
            } catch (e) {
              print('Erro ao processar feature: $e');
              continue;
            }
          }

          print('Total de hospitais de Arapiraca: ${hospitals.length}');
          return hospitals;
        }
      }

      return [];
    } catch (e) {
      print('Erro ao buscar hospitais: $e');
      if (e is DioException) {
        print('Erro Dio: ${e.message}');
        print('Response: ${e.response?.data}');
      }
      return [];
    }
  }
}
