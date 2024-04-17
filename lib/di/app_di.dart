import 'package:common/di/common_di.dart';
import 'package:exercise/di/exercise_di.dart';
import 'package:get_it/get_it.dart';
import 'package:profile/di/profile_di.dart';
import 'package:recipe/di/recipe_di.dart';

final getIt = GetIt.instance;

Future<void> initDi() async {
  await CommonDi.init(getIt);
  await ExerciseDi.init(getIt);
  await profileDi(getIt);
  await RecipeDi.init(getIt);
}
