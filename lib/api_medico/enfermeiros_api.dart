import 'package:dio/dio.dart';
import 'package:infoclin_913/Domain/enfermeiros.dart';

class EnfermeirosApi {
  final dio = Dio();
  String baseUrl = '';

  Future<List<Enfermeiros>> findAll() async {

    List<Enfermeiros> listaEnfermeiros = [];

    final response = await dio.get('$baseUrl/enfermeiros');
    print(response);

    if (response.statusCode == 200) {
      var result = response.data;

      for (var json in result) {
        Enfermeiros enfermeiros = Enfermeiros.fromJson(json);
        listaEnfermeiros.add(enfermeiros);
      }
    }
    return listaEnfermeiros;
  }
}