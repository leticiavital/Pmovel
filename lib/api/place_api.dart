import 'package:dio/dio.dart';
import '../Place.dart';

class PlaceApi {
  final dio = Dio();
  String baseUrl = 'https://api.geoapify.com/v2/places?categories=healthcare.hospital&filter=place:514f20ec14ab5442c05984b9ddcb7d8223c0f00101f901c2a2040000000000c00208&limit=20&apiKey=07f243df0f3446c49091adafd23d04e0';

  Future<Place> findByCity(String city) async {
    final response = await dio.get('$baseUrl/city/$city');

  Place place = Place.fromJson(response.data);
    return place;
  }

}
