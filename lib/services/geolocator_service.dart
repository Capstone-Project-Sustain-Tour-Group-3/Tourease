import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';

class LocationServiceDisabledException implements Exception {
  String get message => "Layanan lokasi tidak tersedia.";
}

class LocationPermissionDeniedException implements Exception {
  String get message => "Izin lokasi ditolak.";
}

class GeolocatorService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar(
        'Error',
        LocationServiceDisabledException().message,
        backgroundColor: ColorDanger.danger200,
        colorText: ColorDanger.danger500,
      ); // Lempar pengecualian jika layanan lokasi tidak tersedia
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar(
          'Error',
          LocationPermissionDeniedException().message,
          backgroundColor: ColorDanger.danger200,
          colorText: ColorDanger.danger500,
        ); // Lempar pengecualian jika izin ditolak
      }
    }

    // Jika izin diberikan dan layanan tersedia, kembalikan posisi saat ini
    return await Geolocator.getCurrentPosition();
  }
}
