import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class DashboardController extends GetxController {
  var users = <UserModel>[].obs;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    loading.value = true;
    try {
      final res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      if (res.statusCode == 200) {
        // log(res.body);
        final List data = json.decode(res.body);
        users.value = data.map((json) => UserModel.fromJson(json)).toList();
      }
    } catch (e) {
      log(e.toString());
    } finally {
      loading.value = false;
    }
  }
}
