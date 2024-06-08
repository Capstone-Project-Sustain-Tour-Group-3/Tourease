import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tourease/pages/saved_route/dummy_data.dart';

class SavedRouteController extends GetxController {
  var selectedRouteTitle = ''.obs;
  var totalCost = 0.0.obs;
  var totalCostString = ''.obs;

  void setSelectedRouteTitle(String title) {
    selectedRouteTitle.value = title;
  }

  void calculateTotalCost() {
    final detailRoute = SavedRouteDummyData.detailRoute;
    double total = 0.0;
    for (var route in detailRoute) {
      var costString = route['cost']!
          .replaceAll('Rp. ', '')
          .replaceAll('.', '')
          .replaceAll(',', '');
      var cost = double.tryParse(costString) ?? 0.0;
      total += cost;
    }
    totalCost.value = total;
    var formatter = NumberFormat("#,##0", "id_ID");
    var formattedTotalCost = formatter.format(total);
    totalCostString.value = 'Rp. $formattedTotalCost';
  }
}
