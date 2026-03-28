import 'package:auth/presentation/sing_in/sing_in_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
  });

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            GestureDetector(
              onTap: () => context.push(SingInView.route),
              child: const Center(
                child: Text('Sign In'),
              ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () => context.go('/exercises'),
              child: const Center(
                child: Text('Exercises'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
