import 'package:dio/dio.dart';
import 'package:infoclin_913/Domain/informacoes.dart';

class  InformacoesApi{
  final dio = Dio();
  String baseUrl = 'https://my-json-server.typicode.com/mklara912/fake-api-klara1';
//LISTA SENDO CRIADA PELA CLASSE INFORMACOESS DART
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