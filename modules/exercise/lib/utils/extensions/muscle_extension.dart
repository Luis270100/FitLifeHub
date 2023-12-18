import 'package:exercise/domain/entities/muscle.dart';

extension MuscleExtension on String {
  Muscle setMuscle() {
    switch (this) {
      case 'abdominals':
        return Muscle.abdominals;
      case 'abductors':
        return Muscle.abductors;
      case 'adductors':
        return Muscle.adductors;
      case 'biceps':
        return Muscle.biceps;
      case 'calves':
        return Muscle.calves;
      case 'chest':
        return Muscle.chest;
      case 'forearms':
        return Muscle.forearms;
      case 'glutes':
        return Muscle.glutes;
      case 'hamstrings':
        return Muscle.hamstrings;
      case 'lats':
        return Muscle.lats;
      case 'lower_back':
        return Muscle.lowerBack;
      case 'middle_back':
        return Muscle.middleBack;
      case 'neck':
        return Muscle.neck;
      case 'quadriceps':
        return Muscle.quadriceps;
      case 'traps':
        return Muscle.traps;
      default:
        return Muscle.general;
    }
  }
}
