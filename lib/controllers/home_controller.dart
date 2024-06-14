import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tourease/model/home_response_model.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/services/geolocator_service.dart';
import 'package:tourease/services/home_service.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:tourease/widgets/snackbar_widget.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Position?> currentLocation = Rx<Position?>(null);
  Rx<String?> currentCity = Rx<String?>(null);
  Rx<String?> savedCity = Rx<String?>(null);
  Rx<String?> savedCompletedCity = Rx<String?>(null);
  Rx<String?> savedProvince = Rx<String?>(null);

  @override
  void onInit() {
    initializeData();
    super.onInit();
  }

  void initializeData() async {
    await getLocation();
    while (savedProvince.value == null) {
      await getLocation();
    }
    getDestinasiPilihan();
    getDestinasiSekitar();
    getDestinasiPopuler();
  }

  Future<void> getLocation() async {
    isLoading.value = true;
    SharedPref.removeSavedLocation();
    try {
      currentLocation.value = await GeolocatorService().getCurrentLocation();
      List<Placemark> placemark = await placemarkFromCoordinates(
        currentLocation.value!.latitude,
        currentLocation.value!.longitude,
      );
      if (placemark.isNotEmpty) {
        currentCity.value = placemark[0]
            .subAdministrativeArea!
            .replaceAll(
              RegExp(
                r'\b(?:kabupaten|kota|regency|city)\b',
                caseSensitive: false,
              ),
              '',
            )
            .trim();
        SharedPref.saveLocation(location: currentCity.value!);
        SharedPref.saveLatitudeLongitude(
          latitude: currentLocation.value!.latitude.toString(),
          longitude: currentLocation.value!.longitude.toString(),
        );
        SharedPref.saveCompletedLocation(
          completedLocation:
              '${placemark[0].name}, ${placemark[0].locality} ${placemark[0].subAdministrativeArea} ${placemark[0].administrativeArea}, ${placemark[0].country}',
        );
        SharedPref.saveProvinceLocation(
          province: placemark[0].administrativeArea!,
        );
        getSavedCity();
      }
    } catch (e) {
      e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void getSavedCity() async {
    savedCity.value = await SharedPref.getSavedLocation();
    savedCompletedCity.value = await SharedPref.getSavedCompletedLocation();
    savedProvince.value = await SharedPref.getSavedProvinceLocation();
  }

  RxInt activeIndex = 0.obs;
  CarouselController carouselController = CarouselController();
  RxList<Destinasi> listDestinasiPilihan = <Destinasi>[].obs;
  RxBool isLoadingDestinasiPilihan = false.obs;

  void getDestinasiPilihan() async {
    isLoadingDestinasiPilihan.value = true;
    try {
      final response =
          await HomeService.getHomeData(provinsi: savedProvince.value!);
      if (response.data != null) {
        listDestinasiPilihan.value = response.data!.destinasiRekomendasi!;
        print('pilihan : $listDestinasiPilihan');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getDestinasiPilihan();
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingDestinasiPilihan.value = false;
    }
  }

  RxList<Destinasi> listDestinasiSekitar = <Destinasi>[].obs;
  RxBool isLoadingDestinasiSekitar = false.obs;

  void getDestinasiSekitar() async {
    isLoadingDestinasiSekitar.value = true;
    try {
      final response =
          await HomeService.getHomeData(provinsi: savedProvince.value!);
      if (response.data != null) {
        listDestinasiSekitar.value = response.data!.destinasiSekitar!;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getDestinasiSekitar();
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingDestinasiSekitar.value = false;
    }
  }

  RxList<DestinasiPopuler> listDestinasiPopuler = <DestinasiPopuler>[].obs;
  RxBool isLoadingDestinasiPopuler = false.obs;

  void getDestinasiPopuler() async {
    isLoadingDestinasiPopuler.value = true;
    try {
      final response =
          await HomeService.getHomeData(provinsi: savedProvince.value!);
      if (response.data != null) {
        listDestinasiPopuler.value = response.data!.destinasiPopuler!;
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getDestinasiPopuler();
        } else {
          SnackbarWidget.showSnackbar(
            message: 'Sesi anda telah berakhir, silahkan login kembali',
          );
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingDestinasiPopuler.value = false;
    }
  }
}
