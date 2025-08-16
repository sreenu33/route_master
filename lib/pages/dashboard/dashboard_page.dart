import 'package:admin_site/controllers/dashboard_controller.dart';
import 'package:admin_site/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(DashboardController());
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.loading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
        itemCount: controller.users.length,
        itemBuilder: (context, index) {
          final user = controller.users[index];
          return ListTile(
            title: Text(user.name, style: const TextStyle(color: Colors.black)),
            subtitle: Text(user.email),
            onTap: () {
              context.go(AppRouteConstants.userDetail(user.id));
          
            },
          );
        },
      );
    });
  }
}
