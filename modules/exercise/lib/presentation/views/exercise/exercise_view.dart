import 'package:flutter/material.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({
    super.key,
  });

  static const String route = '/exercise';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise'),
      ),
      body: const Center(
        child: Text('Exercise'),
      ),
    );
  }
}
