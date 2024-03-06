import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShellWrapper extends StatelessWidget {
  const ShellWrapper({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ShellWrapper'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Exercises'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Recipes'),
          BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'Profile'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
}
