import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tourease/model/kota_destinasi_response_model.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/pages/route_recommendation/search_route/search_route_model.dart';
import 'package:tourease/services/destinasi_service.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class SearchRouteController extends GetxController {
  var destinations = <SearchRouteModel>[].obs;
  var destinationIds = <String>[].obs;
  var availableDestinations = <SearchRouteModel>[].obs;
  Rx<KotaDestinasiResponseModel> kotaDestinasiResponse =
      KotaDestinasiResponseModel().obs;

  void getDestinationCities({required String id}) async {
    try {
      final response = await DestinasiService().getDestinationByCity(id: id);
      kotaDestinasiResponse.value = response;

      availableDestinations.clear();
      if (response.data != null) {
        List<SearchRouteModel> apiDestinations = response.data!
            .map((datum) => SearchRouteModel(
                name: datum.namaDestinasi ?? 'Unknown Destination',
                subtitle:
                    '${datum.namaJalan} ${datum.kecamatan} ${datum.kota} ${datum.provinsi}',
                id: datum.id))
            .toList();

        availableDestinations.addAll(apiDestinations);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getDestinationCities(id: id);
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage(showIconButton: false,));
        }
      }
    }
  }

  void addDestinations(SearchRouteModel destination) {
    // Menghindari duplikat data
    bool exists = destinations.any((element) =>
        element.name == destination.name &&
        element.subtitle == destination.subtitle);

    if (!exists && destinations.length < 3) {
      destinations.add(destination);
      List<String?> ids =
          destinations.map((destination) => destination.id).toList();
      ids.removeWhere((id) => id == null);
      destinationIds.assignAll(ids.cast<String>());
      availableDestinations.remove(destination);
    } else if (destinations.length >= 3) {
      SnackbarWidget.showSnackbar(
          message: "Maaf, rute tujuan anda telah mencapai maksimal");
    }
  }

  void removeDestination(SearchRouteModel destination) {
    destinations.remove(destination);
    destinationIds.remove(destination.id);
    availableDestinations.add(destination);
  }
}
