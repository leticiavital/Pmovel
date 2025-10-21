import 'package:dio/dio.dart';
import 'package:infoclin_913/domain/medico.dart';

import '../domain/medico2.dart';

class DoctorsApi {
  final dio = Dio();
  String baseUrl = 'https://doctorsapi.com/api';

  Future<List<Doctors>> findDoctors() async {
    List<Doctors> list = [];
    final response = await dio.get('$baseUrl/doctors/');
    print(response.data);

    var jsonList =  response.data['doctors'];
    for(var json in jsonList){
      Doctors doctors = Doctors.fromJson(json);
      list.add(doctors);
    }


    return list;
  }
}