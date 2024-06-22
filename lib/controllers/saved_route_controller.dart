import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tourease/model/profile_saved_route_detail_response_model.dart';
import 'package:tourease/model/profile_saved_route_response_model.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/pages/saved_route/dummy_data.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/services/saved_route_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

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

  String formatRupiah(int number) {
    final formatCurrency =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatCurrency.format(number);
  }

  Rx<SavedRouteProfileResponse> savedRoute = SavedRouteProfileResponse().obs;
  RxBool isLoadingSavedRoute = false.obs;

  void getSavedRoute() async {
    isLoadingSavedRoute.value = true;
    savedRoute.value = SavedRouteProfileResponse();
    try {
      final response = await SavedRouteService.getSavedRoute();
      savedRoute.value = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getSavedRoute();
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingSavedRoute.value = false;
    }
  }

  Rx<DetailSavedRouteResponse> detailRoute = DetailSavedRouteResponse().obs;
  RxBool isLoadingDetailRoute = false.obs;

  void getDetailRoute({required String id}) async {
    isLoadingDetailRoute.value = true;
    detailRoute.value = DetailSavedRouteResponse();
    try {
      final response = await SavedRouteService.getDetailSavedRoute(id: id);
      detailRoute.value = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getDetailRoute(id: id);
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingDetailRoute.value = false;
    }
  }

  Future<bool> deleteSavedRoute({required String id}) async {
    try {
      await SavedRouteService.deleteSavedRoute(id: id);
      getSavedRoute();
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          return await deleteSavedRoute(id: id);
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      } else {
        SnackbarWidget.showSnackbar(
          message: 'Gagal menghapus rute, silahkan coba lagi',
        );
      }
    }
    return false;
  }
}
