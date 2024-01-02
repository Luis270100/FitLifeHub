import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecipesDio {
  RecipesDio() {
    _dio = Dio();
    final apiKey = dotenv.env['SPOONACULAR'];
    _dio.options = BaseOptions(
      baseUrl:
          'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey',
      headers: {
        'Accept': 'application/json',
      },
    );
  }

  late Dio _dio;

  Dio get instance => _dio;
}
