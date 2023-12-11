import 'package:dio/dio.dart';

class ExerciseDio {
  ExerciseDio() {
    _dio = Dio();

    _dio.options = BaseOptions(
      baseUrl: 'https://api.api-ninjas.com/v1/exercises',
      headers: {
        'Accept': 'application/json',
        'X-Api-Key': 'API_KEY',
      },
    );
  }

  late Dio _dio;

  Dio get instance => _dio;
}
