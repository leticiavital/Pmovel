import 'package:dio/dio.dart';
import 'package:infoclin_913/Domain/enfermeiros.dart';

class EnfermeirosApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/ary0410/fake-api-aryy1';

  Future<List<Enfermeiros1>> findAll() async {

    List<Enfermeiros1> listaEnfermeiros = [];

    final response = await dio.get('$baseUrl/enfermeiros');
    print(response);

    if (response.statusCode == 200) {
      var result = response.data;

      for (var json in result) {
        Enfermeiros1 enfermeiros = Enfermeiros1.fromJson(json);
        listaEnfermeiros.add(enfermeiros);
      }
    }
    return listaEnfermeiros;
  }
}