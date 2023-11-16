import 'package:fit_life_hub/common_main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: 'env/.env.dev');
  await commonMain();
}
