import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'side_nav.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final GoRouter router = GoRouter.of(context);

    return WillPopScope(
      onWillPop: () async {
        if (router.canPop()) {
          // If there's navigation history, go back
          router.pop();
        } else {
          // No history: close the app on mobile, or do nothing on web
          return true; // returning true allows system to handle it
        }
        return false; // we already handled pop
      },
      child: Scaffold(
        body: Row(
          children: [
            const SideNav(),
            Expanded(
              child: Column(
                children: [
                  AppBar(
                    title: const Text('Admin Panel'),
                    backgroundColor: Colors.blue,
                    elevation: 1,
                  ),
                  Expanded(child: child),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
