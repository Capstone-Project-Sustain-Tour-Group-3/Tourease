import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tourease/model/route_request_model.dart';
import 'package:tourease/model/route_response_model.dart';
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
            longitude: latitude,
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
}
