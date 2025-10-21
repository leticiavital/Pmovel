import 'package:dio/dio.dart';
import 'package:infoclin_913/domain/medico.dart';

import '../domain/medico2.dart';

class MedicoApi {
  final dio = Dio();
  String baseUrl = 'https://doctorsapi.com/api';

  Future<Medico2> findByStateAndSpecialties(String state, String specialties) async {
    final response = await dio.get('$baseUrl/doctors');
    print(response.data);

    Medico2 medico2 = Medico2.fromJson(response.data);
    return medico2;
  }
}