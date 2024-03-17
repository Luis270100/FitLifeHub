enum ExerciseType {
  none(''),
  cardio('cardio'),
  olympicWeightlifting('olympic_weightlifting'),
  plyometrics('plyometrics'),
  powerlifting('powerlifting'),
  strength('strength'),
  stretching('stretching'),
  strongman('strongman');

  const ExerciseType(this.value);

  final String value;
}
