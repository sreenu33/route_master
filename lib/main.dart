import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_router.dart'; // import the GoRouter instance
import 'controllers/nav_controller.dart';

void main() {
  Get.put(NavController()); // Register controller globally
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      theme: ThemeData(useMaterial3: true),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
