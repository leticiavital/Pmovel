import 'package:dio/dio.dart';
import 'package:infoclin_913/domain/informacoes.dart';

class  InformacoesApi{
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/mklara912/fake-api-klara1';

  Future<List<Informacoes>> findAll() async {

    List<Informacoes> listaInfo = [];

    final response = await dio.get('$baseUrl/informacoes');
    print(response);

    if (response.statusCode == 200) {
      var result = response.data;

      // ForEach
      for (var json in result) {
        Informacoes informacoes = Informacoes.fromJson(json);
        listaInfo.add(informacoes);
      }
    }
    return listaInfo;
  }
}