import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:protrack_golf/app/router/app_routes.dart';
import 'package:protrack_golf/core/core.dart';

/// The bottom-navigation shell wrapping the three main tabs: Log/History,
/// My Bag, and Progress. Each tab keeps its own [Scaffold]/AppBar; this
/// shell only owns the bottom navigation bar.
class AppShell extends StatelessWidget {
  const AppShell({required this.child, required this.location, super.key});

  final Widget child;
  final String location;

  int get _selectedIndex => location.startsWith(MyBagRoutes.tab) ? 1 : 0;

  void _onDestinationSelected(BuildContext context, int index) {
    switch (index) {
      case 1:
        context.go(MyBagRoutes.tab);
      default:
        context.go(SessionsRoutes.tab);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: DecoratedBox(
        // A hard top edge so the bar reads as a separate surface in sun.
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.border, width: AppStrokes.thin),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) =>
              _onDestinationSelected(context, index),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.golf_course_outlined),
              selectedIcon: Icon(Icons.golf_course),
              label: 'Range',
            ),
            NavigationDestination(
              icon: Icon(Icons.backpack_outlined),
              selectedIcon: Icon(Icons.backpack),
              label: 'My Bag',
            ),
          ],
        ),
      ),
    );
  }
}
