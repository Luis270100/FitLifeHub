enum Muscle {
  general('general'),
  abdominals('abdominals'),
  abductors('abductors'),
  adductors('adductors'),
  biceps('biceps'),
  calves('calves'),
  chest('chest'),
  forearms('forearms'),
  glutes('glutes'),
  hamstrings('hamstrings'),
  lats('lats'),
  lowerBack('lower_back'),
  middleBack('middle_back'),
  neck('neck'),
  quadriceps('quadriceps'),
  traps('traps'),
  triceps('triceps');

  const Muscle(this.value);

  final String value;
}
