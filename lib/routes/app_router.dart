import 'package:admin_site/components/table_column_config.dart';
import 'package:admin_site/components/table_screen.dart';
import 'package:admin_site/controllers/images_controller.dart';
import 'package:admin_site/models/images_model.dart';
import 'package:admin_site/pages/dashboard/user_datails_page.dart';
import 'package:admin_site/pages/edit_profile_page.dart';
import 'package:admin_site/pages/help_page.dart';
import 'package:admin_site/pages/image_detail_page.dart';
import 'package:admin_site/pages/images_page.dart';
import 'package:admin_site/pages/patient/patient_page.dart';
import 'package:admin_site/pages/reports_page.dart';
import 'package:admin_site/pages/settings_page.dart';
import 'package:admin_site/pages/view_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/home_item1_page.dart';
import '../pages/home_item2_page.dart';
import 'app_route_constants.dart';
import '../widgets/main_layout.dart';

final router = GoRouter(
  initialLocation: AppRouteConstants.dashboard,
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: AppRouteConstants.dashboard,
          builder: (context, state) => const DashboardPage(),
          routes: [
            GoRoute(
              path: '/user-detail/:id',
              name: UserDetailsPage.routeName,
              builder: (context, state) {
                final id = int.tryParse(state.pathParameters['id'] ?? '');
                if (id == null) {
                  return const Scaffold(
                    body: Center(child: Text('Invalid User ID')),
                  );
                }
                return UserDetailsPage(userId: id);
              },
            ),
          ],
        ),

        GoRoute(
          path: AppRouteConstants.homeItem1,
          builder: (context, state) => const HomeItem1Page(),
          routes: [
            GoRoute(
              path: ImagesPage.routePath,
              name: ImagesPage.routeName,
              builder: (context, state) {
                // Ensure controller is registered
                Get.put(ImagesPageController());
                return const ImagesPage();
              },
              routes: [
                GoRoute(
                  path: ':id',
                  name: ImageDetailsPage.routeName,
                  builder: (context, state) {
                    final id = state.pathParameters['id']!;
                    final img = state.extra as ImageModel?;
                    return ImageDetailsPage(id: id, image: img);
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          path: AppRouteConstants.homeItem2,
          builder: (context, state) => const HomeItem2Page(),
        ),
        GoRoute(
          path: AppRouteConstants.profileView,
          builder: (context, state) => const ViewProfilePage(),
        ),
        GoRoute(
          path: AppRouteConstants.profileEdit,
          builder: (context, state) => const EditProfilePage(),
        ),
        GoRoute(
          path: AppRouteConstants.profileSettings,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: AppRouteConstants.reports,
          builder: (context, state) => const ReportsPage(),
        ),
        GoRoute(
          path: AppRouteConstants.help,
          builder: (context, state) => const HelpPage(),
        ),
        GoRoute(
          path: AppRouteConstants.patient,
          builder: (context, state) => const PatientPage(),
        ),
        GoRoute(
          path: AppRouteConstants.table,
          builder: (context, state) {
            return TableScreen(data: dummyRows, columns: dummyColumns);
          },
        ),
      ],
    ),
  ],
);
