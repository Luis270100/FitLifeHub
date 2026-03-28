import 'package:auth/presentation/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SingInView extends StatelessWidget {
  const SingInView({
    super.key,
  });

  static const String route = '/sing-in';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 100),
            GestureDetector(
              onTap: () => context.push(LoginView.route),
              child: const Center(
                child: Text('Log In'),
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
