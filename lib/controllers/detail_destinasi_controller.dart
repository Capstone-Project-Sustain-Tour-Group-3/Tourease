import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tourease/model/detail_destinasi_response_model.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/services/destinasi_service.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class DetailDestinasiController extends GetxController {
  RxInt activeIndex = 0.obs;
  CarouselController carouselController = CarouselController();

  RxBool isLoadingDetailDestinasi = false.obs;
  Rx<DetailDestinasiResponseModel> detailDestinasi =
      DetailDestinasiResponseModel().obs;

  void getDetailDestinasi({required String id}) async {
    isLoadingDetailDestinasi.value = true;
    detailDestinasi.value = DetailDestinasiResponseModel();
    try {
      final response = await DestinasiService().getDetailDestinasi(id: id);
      detailDestinasi.value = response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getDetailDestinasi(id: id);
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingDetailDestinasi.value = false;
    }
  }
}
