import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tourease/model/route_request_model.dart';
import 'package:tourease/model/route_response_model.dart';
import 'package:tourease/model/save_route_request_model.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/pages/route_recommendation/save_route/save_route_page.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/services/route_recommendation_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class RouteRecommendationController extends GetxController {
  RxBool isLoadingPostRoute = false.obs;
  Rx<RouteResponseModel> routeResponseModel = RouteResponseModel().obs;
  RxBool isLastRoute = false.obs;
  RxBool isFirstRoute = false.obs;
  RxString namaKota = ''.obs;
  RxBool isRouteSaved = false.obs;

  void postRouteRecommendation({
    required String idKota,
    required List<String> idDestinasiTujuan,
    required String namaLokasiAwal,
    required double latitude,
    required double longitude,
  }) async {
    final route = RouteRequestModel(
      idKota: idKota,
      lokasiAwal: LokasiAwalRequest(
        nama: namaLokasiAwal,
        latitude: latitude,
        longitude: longitude,
      ),
      idDestinasiTujuan: idDestinasiTujuan,
    );
    isLoadingPostRoute.value = true;
    try {
      final response =
          await RouteRecommendationService().postRouteRecommendation(route);
      routeResponseModel.value = response;
      Get.off(() => SaveRoutePage());
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          postRouteRecommendation(
            idKota: idKota,
            idDestinasiTujuan: idDestinasiTujuan,
            namaLokasiAwal: namaLokasiAwal,
            latitude: latitude,
            longitude: longitude,
          );
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      } else {
        SnackbarWidget.showSnackbar(
          message: e.toString(),
        );
      }
    } finally {
      isLoadingPostRoute.value = false;
    }
  }

  Future<bool> saveRoute(SaveRouteRequestModel saveRouteRequest) async {
    try {
      await RouteRecommendationService().postSaveRoute(saveRouteRequest);
      isRouteSaved.value = true;
      return true;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          return saveRoute(saveRouteRequest);
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
          return false;
        }
      } else {
        SnackbarWidget.showSnackbar(
          message: 'Gagal menyimpan rute, silahkan coba lagi',
        );
      }
      return false;
    }
  }

  void resetRouteSaved() {
    isRouteSaved.value = false;
  }
}
