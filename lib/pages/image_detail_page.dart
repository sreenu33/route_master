import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../controllers/images_controller.dart';
import '../models/images_model.dart';

class ImageDetailsPage extends StatefulWidget {
  static const routePath = '/image-detail/:id';
  static const routeName = 'image-detail';

  final String id;
  final ImageModel? image;

  const ImageDetailsPage({super.key, required this.id, this.image});

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  ImageModel? image;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() async {
    if (widget.image != null) {
      // If passed via extra, no need to fetch
      setState(() {
        image = widget.image;
        loading = false;
      });
      return;
    }

    // Fetch from API using ID
    final controller = Get.find<ImagesPageController>();
    final result = await controller.fetchImageById(widget.id);
    setState(() {
      image = result;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (image == null) {
      return const Scaffold(body: Center(child: Text("Image not found")));
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(image!.title!, maxLines: 1, overflow: TextOverflow.ellipsis),
            CachedNetworkImage(
              imageUrl: image!.url!,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
    );
  }
}
