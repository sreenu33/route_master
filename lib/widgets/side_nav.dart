import 'package:admin_site/widgets/nav_item_builder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_route_constants.dart';

class SideNav extends StatelessWidget {
  const SideNav({super.key});

  bool _isParentSelected(String currentPath, List<String> childRoutes) {
    return childRoutes.any((route) => currentPath.startsWith(route));
  }

  @override
  Widget build(BuildContext context) {
    final currentPath = GoRouterState.of(context).uri.toString();

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          NavItemBuilder.build(
            context: context,
            icon: Icons.dashboard,
            title: 'Dashboard',
            route: AppRouteConstants.dashboard,
            currentPath: currentPath,
          ),

          ExpansionTile(
            initiallyExpanded: _isParentSelected(currentPath, [
              AppRouteConstants.homeItem1,
              AppRouteConstants.homeItem2,
            ]),
            leading: Icon(
              Icons.home,
              size: 20,
              color:
                  _isParentSelected(currentPath, [
                    AppRouteConstants.homeItem1,
                    AppRouteConstants.homeItem2,
                  ])
                  ? Colors.blue
                  : Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                fontWeight:
                    _isParentSelected(currentPath, [
                      AppRouteConstants.homeItem1,
                      AppRouteConstants.homeItem2,
                    ])
                    ? FontWeight.bold
                    : FontWeight.normal,
                color:
                    _isParentSelected(currentPath, [
                      AppRouteConstants.homeItem1,
                      AppRouteConstants.homeItem2,
                    ])
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            children: [
              NavItemBuilder.build(
                context: context,
                icon: Icons.circle,
                title: 'Home Item 1',
                route: AppRouteConstants.homeItem1,
                currentPath: currentPath,
                isSubItem: true,
              ),
              NavItemBuilder.build(
                context: context,
                icon: Icons.circle,
                title: 'Home Item 2',
                route: AppRouteConstants.homeItem2,
                currentPath: currentPath,
                isSubItem: true,
              ),
            ],
          ),

          ExpansionTile(
            initiallyExpanded: _isParentSelected(currentPath, [
              AppRouteConstants.profileView,
              AppRouteConstants.profileEdit,
              AppRouteConstants.profileSettings,
            ]),
            leading: Icon(
              Icons.person,
              size: 20,
              color:
                  _isParentSelected(currentPath, [
                    AppRouteConstants.profileView,
                    AppRouteConstants.profileEdit,
                    AppRouteConstants.profileSettings,
                  ])
                  ? Colors.blue
                  : Colors.black54,
            ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontWeight:
                    _isParentSelected(currentPath, [
                      AppRouteConstants.profileView,
                      AppRouteConstants.profileEdit,
                      AppRouteConstants.profileSettings,
                    ])
                    ? FontWeight.bold
                    : FontWeight.normal,
                color:
                    _isParentSelected(currentPath, [
                      AppRouteConstants.profileView,
                      AppRouteConstants.profileEdit,
                      AppRouteConstants.profileSettings,
                    ])
                    ? Colors.blue
                    : Colors.black87,
              ),
            ),
            children: [
              NavItemBuilder.build(
                context: context,
                icon: Icons.circle,
                title: 'View Profile',
                route: AppRouteConstants.profileView,
                currentPath: currentPath,
                isSubItem: true,
              ),
              NavItemBuilder.build(
                context: context,
                icon: Icons.circle,
                title: 'Edit Profile',
                route: AppRouteConstants.profileEdit,
                currentPath: currentPath,
                isSubItem: true,
              ),
              NavItemBuilder.build(
                context: context,
                icon: Icons.circle,
                title: 'Profile Settings',
                route: AppRouteConstants.profileSettings,
                currentPath: currentPath,
                isSubItem: true,
              ),
            ],
          ),
          NavItemBuilder.build(
            context: context,
            icon: Icons.report,
            title: 'Reports',
            route: AppRouteConstants.reports,
            currentPath: currentPath,
          ),
          NavItemBuilder.build(
            context: context,
            icon: Icons.help,
            title: 'Help',
            route: AppRouteConstants.help,
            currentPath: currentPath,
          ),
          NavItemBuilder.build(
            context: context,
            icon: Icons.usb_rounded,
            title: 'Patient Details',
            route: AppRouteConstants.patient,
            currentPath: currentPath,
          ),
          NavItemBuilder.build(
            context: context,
            icon: Icons.table_bar,
            title: 'Dynamic Tables',
            route: AppRouteConstants.table,
            currentPath: currentPath,
          ),
        ],
      ),
    );
  }
}
