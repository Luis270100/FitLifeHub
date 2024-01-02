import 'package:equatable/equatable.dart';

class Recipe extends Equatable {
  const Recipe({
    this.id = '',
    this.title = '',
    this.thumbnailUrl = '',
  });

  final String id;
  final String title;
  final String thumbnailUrl;

  @override
  List<Object?> get props => [
        id,
        title,
        thumbnailUrl,
      ];
}
