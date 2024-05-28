import 'package:get/get.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class DestinasiController extends GetxController {
  RxList searchHistory = <String>[].obs;

  @override
  void onInit() {
    loadSearchHistory();
    super.onInit();
  }

  void loadSearchHistory() async {
    List<String> history = await SharedPref.getSearchHistory();
    searchHistory.assignAll(history);
  }

  void saveSearchHistory(String value) async {
    SharedPref.saveSearchHistory(value);
    searchHistory.add(value);
  }

  void deleteSearchHistory(int index) async {
    SharedPref.deleteSearchHistory(index);
    searchHistory.removeAt(index);
  }
}
