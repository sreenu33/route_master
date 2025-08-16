import 'package:get/get.dart';

class NavController extends GetxController {
  var selectedRoute = ''.obs;

  void setRoute(String route) {
    selectedRoute.value = route;
  }
}