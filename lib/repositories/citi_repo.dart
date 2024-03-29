import 'package:dio/dio.dart';

import '../models/citi_model.dart';

class CitiRepo {
  final Dio _dio = Dio();
  Future<Citi> fetchCiti(String location) async {
    final response = await _dio.get(
        "https://geocoding-api.open-meteo.com/v1/search?name=$location&count=20");
    if (response.statusCode == 200) {
      final Map<String, dynamic> dataBody = response.data;
      return Citi.fromJson(dataBody);
    } else {
      throw 'Error';
    }
  }
}
