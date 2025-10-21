import 'package:dio/dio.dart';
import '../Domain/medico2.dart';

class MedicosApi {
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/nicolly912/fake-api';

  Future<Medico?> buscarMedicoPorSintoma(String sintoma) async {
    if (sintoma == "") return null;

    try {
      final response = await dio.get('$baseUrl/$sintoma');

      if (response.statusCode == 200) {
        var data = response.data;
        return Medico.fromJson(data);
      } else {
        print('Erro ao acessar API: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Erro: $e');
      return null;
    }
  }
}
