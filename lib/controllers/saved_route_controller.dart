import 'package:get/get.dart';

class SavedRouteController extends GetxController{
  var selectedRouteTitle = ''.obs;

  void setSelectedRouteTitle(String title) {
    selectedRouteTitle.value = title;
  }
}