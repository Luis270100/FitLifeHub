import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ExerciseDio {
  ExerciseDio() {
    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl: 'https://api.api-ninjas.com/v1/exercises',
      headers: {
        'Accept': 'application/json',
        'X-Api-Key': dotenv.env['NINJAAPIKEY'],
      },
    );
  }

  late Dio _dio;

  Dio get instance => _dio;
}
