import 'package:carousel_slider/carousel_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tourease/pages/home/home_container_pilihan_destinasi.dart';
import 'package:tourease/services/geolocator_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  Rx<Position?> currentLocation = Rx<Position?>(null);
  Rx<String?> currentCity = Rx<String?>(null);
  Rx<String?> savedCity = Rx<String?>(null);
  Rx<String?> savedCompletedCity = Rx<String?>(null);

  @override
  void onInit() {
    getLocation();
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
              '${placemark[0].name}, ${placemark[0].locality}, ${placemark[0].administrativeArea}, ${placemark[0].country}',
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
  }

  RxInt activeIndex = 0.obs;
  CarouselController carouselController = CarouselController();
  RxList listContainerPilihanDestinasi = [
    const HomeContainerDestination(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/c40e/7a16/92ad4487d72b3ebd0d50481556a01d63?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=C0za7zGlwMzoNOVsu7ozAXVj9VoSyHJdytvaTl9O8Ixr8XuU1lTeMFQMhAwXrdFcYJnTouZbSC-DryHD0Peu0zkV9uGKbMv0Hv7PJL1NzAnYc43NVyjcivwI0DOPRvuhpzYbaEHOCOlBZZ6EjHYl5spWMl9Z51QTtPHvdIrKxI~PcD4cxgG6bPoM14SHn~yLiJxwfiTaiJbTkDOYDSCOMdrDA9F-oMCYl0L5q6Zabsl1ryX1jfU0kN~sW06LwG3jS-~3OmopXslRFVmgeDLRgTEZ2g2eHbQQn41dPzdHTEEJ6Lb6-8vQvPiBRT7JO8yogGvs2zI1LT3a6GPKa6abGA__',
      location: 'Ulen Sentalu, Yogyakarta',
    ),
    const HomeContainerDestination(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/c40e/7a16/92ad4487d72b3ebd0d50481556a01d63?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=C0za7zGlwMzoNOVsu7ozAXVj9VoSyHJdytvaTl9O8Ixr8XuU1lTeMFQMhAwXrdFcYJnTouZbSC-DryHD0Peu0zkV9uGKbMv0Hv7PJL1NzAnYc43NVyjcivwI0DOPRvuhpzYbaEHOCOlBZZ6EjHYl5spWMl9Z51QTtPHvdIrKxI~PcD4cxgG6bPoM14SHn~yLiJxwfiTaiJbTkDOYDSCOMdrDA9F-oMCYl0L5q6Zabsl1ryX1jfU0kN~sW06LwG3jS-~3OmopXslRFVmgeDLRgTEZ2g2eHbQQn41dPzdHTEEJ6Lb6-8vQvPiBRT7JO8yogGvs2zI1LT3a6GPKa6abGA__',
      location: 'Ulen Sentalu, Yogyakarta',
    ),
    const HomeContainerDestination(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/c40e/7a16/92ad4487d72b3ebd0d50481556a01d63?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=C0za7zGlwMzoNOVsu7ozAXVj9VoSyHJdytvaTl9O8Ixr8XuU1lTeMFQMhAwXrdFcYJnTouZbSC-DryHD0Peu0zkV9uGKbMv0Hv7PJL1NzAnYc43NVyjcivwI0DOPRvuhpzYbaEHOCOlBZZ6EjHYl5spWMl9Z51QTtPHvdIrKxI~PcD4cxgG6bPoM14SHn~yLiJxwfiTaiJbTkDOYDSCOMdrDA9F-oMCYl0L5q6Zabsl1ryX1jfU0kN~sW06LwG3jS-~3OmopXslRFVmgeDLRgTEZ2g2eHbQQn41dPzdHTEEJ6Lb6-8vQvPiBRT7JO8yogGvs2zI1LT3a6GPKa6abGA__',
      location: 'Ulen Sentalu, Yogyakarta',
    ),
    const HomeContainerDestination(
      imageUrl:
          'https://s3-alpha-sig.figma.com/img/c40e/7a16/92ad4487d72b3ebd0d50481556a01d63?Expires=1717977600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=C0za7zGlwMzoNOVsu7ozAXVj9VoSyHJdytvaTl9O8Ixr8XuU1lTeMFQMhAwXrdFcYJnTouZbSC-DryHD0Peu0zkV9uGKbMv0Hv7PJL1NzAnYc43NVyjcivwI0DOPRvuhpzYbaEHOCOlBZZ6EjHYl5spWMl9Z51QTtPHvdIrKxI~PcD4cxgG6bPoM14SHn~yLiJxwfiTaiJbTkDOYDSCOMdrDA9F-oMCYl0L5q6Zabsl1ryX1jfU0kN~sW06LwG3jS-~3OmopXslRFVmgeDLRgTEZ2g2eHbQQn41dPzdHTEEJ6Lb6-8vQvPiBRT7JO8yogGvs2zI1LT3a6GPKa6abGA__',
      location: 'Ulen Sentalu, Yogyakarta',
    ),
  ].obs;
}
