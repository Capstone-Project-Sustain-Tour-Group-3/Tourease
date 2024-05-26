import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tourease/services/geolocator_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Position?> currentLocation = Rx<Position?>(null);
  Rx<String?> currentCity = Rx<String?>(null);
  Rx<String?> savedCity = Rx<String?>(null);

  @override
  void onInit() {
    getLocation();
    getSavedCity();
    super.onInit();
  }

  void getLocation() async {
    isLoading.value = true;
    SharedPref.removeSavedLocation();
    try {
      currentLocation.value = await GeolocatorService().getCurrentLocation();
      List<Placemark> placemark = await placemarkFromCoordinates(
        currentLocation.value!.latitude,
        currentLocation.value!.longitude,
      );
      String? place = placemark[0].subAdministrativeArea;
      if (place != null) {
        currentCity.value = place;
        SharedPref.saveLocation(location: currentCity.value!);
        SharedPref.saveLatitudeLongitude(
          latitude: currentLocation.value!.latitude.toString(),
          longitude: currentLocation.value!.longitude.toString(),
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
  }
}
