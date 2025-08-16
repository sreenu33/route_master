import 'package:admin_site/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailsPage extends StatelessWidget {
  static const routePath = '/user-detail/:id';
  static const routeName = 'user-detail';
  final int userId;

  const UserDetailsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.find<DashboardController>();

    return Obx(() {
      if (controller.loading.value) {
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      }

      final user = controller.users.firstWhereOrNull((u) => u.id == userId);

      if (user == null) {
        return const Scaffold(body: Center(child: Text('User not found')));
      }

      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${user.id}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Name: ${user.name}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text('Email: ${user.email}', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      );
    });
  }
}
