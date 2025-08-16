import 'package:get/get.dart';
import 'package:admin_site/models/images_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImagesPageController extends GetxController {
  var loading = false.obs;
  var images = <ImageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchImages();
  }

  Future<void> fetchImages() async {
    loading.value = true;
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos?_limit=20'),
      );
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        images.value = data.map((item) => ImageModel.fromJson(item)).toList();
      } else {
        images.clear();
      }
    } catch (e) {
      images.clear();
    } finally {
      loading.value = false;
    }
  }

  Future<ImageModel?> fetchImageById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/photos/$id'),
      );
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ImageModel.fromJson(json);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
