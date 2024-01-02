import 'package:equatable/equatable.dart';

class Step extends Equatable {
  const Step({
    this.number = 0,
    this.step = '',
  });

  final int number;
  final String step;

  @override
  List<Object?> get props => [
        number,
        step,
      ];
}
