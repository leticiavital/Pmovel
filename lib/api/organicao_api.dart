import 'package:dio/dio.dart';
import 'package:infoclin_913/Domain/Organizacao.dart';


class OrganicaoApi {
  final dio = Dio();
  String baseUrl = 'https://doctorsapi.com/api';

  Future<List<Organizations>> findEsp() async {
    List<Organizations> list = [];
    Map<String, dynamic> headers = {
      "api-key": "hk_mh3nefeoc0e876ee49ebf0812400438fc4e441efe461da68f9a2b897d30cb8c312af631a"
    };

    final response = await dio.get(
      '$baseUrl/organizations',
      options: Options(headers: headers),
    );
    print(response.data);

    var jsonList =  response.data['organizations'];

    for(var json in jsonList){
      Organizations organizations = Organizations.fromJson(json);
      list.add(organizations);
    }

    return list;
  }
}