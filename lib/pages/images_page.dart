import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/images_controller.dart';
import 'image_detail_page.dart';
import 'package:go_router/go_router.dart';

class ImagesPage extends StatelessWidget {
  static const routePath = '/images';
  static const routeName = 'images';

  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Ensure controller is registered
    final controller = Get.put(ImagesPageController());

    return Scaffold(
      body: Obx(() {
        if (controller.loading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.images.isEmpty) {
          return const Center(child: Text("No images found"));
        }

        return ListView.builder(
          itemCount: controller.images.length,
          itemBuilder: (context, index) {
            final img = controller.images[index];

            return ListTile(
              leading: CachedNetworkImage(
                imageUrl: img.thumbnailUrl!,
                width: 50,
                height: 50,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text(
                img.title!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                // Navigate to ImageDetailsPage passing the image ID and model
                context.goNamed(
                  ImageDetailsPage.routeName,
                  pathParameters: {'id': img.id.toString()},
                  extra: img,
                );
              },
            );
          },
        );
      }),
    );
  }
}
