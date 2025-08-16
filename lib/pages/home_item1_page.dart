import 'package:admin_site/pages/images_page.dart';
import 'package:admin_site/routes/app_route_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeItem1Page extends StatelessWidget {
  const HomeItem1Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Home Item 1 Page'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            context.goNamed(ImagesPage.routeName);
          },
          child: const Text('Go to'),
        ),
      ],
    );
  }
}
