import 'package:dio/dio.dart';

class RecipeDio {
  RecipeDio() {
    _dio = Dio();
    _dio.options = BaseOptions(
      baseUrl:
          'https://api.spoonacular.com/recipes',
      headers: {
        'Accept': 'application/json',
      },
    );
  }

  late Dio _dio;

  Dio get instance => _dio;
}
