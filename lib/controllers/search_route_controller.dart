import 'package:get/get.dart';
import 'package:tourease/pages/route_recommendation/search_route/dummy_data.dart';
import 'package:tourease/pages/route_recommendation/search_route/dummy_model.dart';

class SearchRouteController extends GetxController {
  var currentLocation = 'Hotel Ketapang Indah'.obs;
  var destinations = <SearchRouteDummyModel>[].obs;
  var availableDestinations = <SearchRouteDummyModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
  }

  void loadDummyData() {
    availableDestinations.addAll(SearchRouteDummyData.destinationRecommendations
        .map((data) => SearchRouteDummyModel(
            name: data['name']!, subtitle: data['subtitle']!)));
  }

  void addDestinations(SearchRouteDummyModel destination) {
    if (destinations.length < 3) {
      destinations.add(destination);
    }
  }

  void removeDestination(SearchRouteDummyModel destination) {
    destinations.remove(destination);
  }
}
