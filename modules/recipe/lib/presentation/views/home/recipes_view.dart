import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({
    super.key,
  });

  static const String route = '/recipes';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/home'),
      child: const Center(
        child: Text('Recipes'),
      ),
    );
  }
}
