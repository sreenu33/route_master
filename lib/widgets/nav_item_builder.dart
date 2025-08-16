import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavItemBuilder {
  /// Builds a navigation ListTile for side menus
  static Widget build({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String route,
    required String currentPath,
    bool isSubItem = false,
  }) {
    bool isSelected = currentPath == route;

    return ListTile(
      dense: isSubItem,
      contentPadding: EdgeInsets.only(
        left: isSubItem ? 48 : 16,
        right: 16,
      ),
      leading: Icon(
        icon,
        size: isSubItem ? 16 : 20, // fixed smaller size for subitems
        color: isSelected ? Colors.blue : Colors.black54,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.blue : Colors.black87,
        ),
      ),
      onTap: () {
        if (currentPath != route) {
          context.go(route);
        }
      },
    );
  }
}
