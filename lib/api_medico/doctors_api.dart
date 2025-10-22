import 'package:dio/dio.dart';
import '../Domain/doctors.dart';

class DoctorsApi {
  final dio = Dio();
  String baseUrl = 'https://doctorsapi.com/api';

  Future<List<Doctors>> findDoctors() async {
    List<Doctors> list = [];
    Map<String, dynamic> headers = {
      "api-key": "hk_mgqncn0o855b12406f7ab8dd5950083ef70d34796c6edd969c1a60568f59d941b4f5387b"
    };

    final response = await dio.get(
      '$baseUrl/doctors',
      options: Options(headers: headers),
    );
    print(response.data);

    var jsonList =  response.data['doctors'];

    for(var json in jsonList){
      Doctors doctors = Doctors.fromJson(json);
      list.add(doctors);
    }

    return list;
  }
}