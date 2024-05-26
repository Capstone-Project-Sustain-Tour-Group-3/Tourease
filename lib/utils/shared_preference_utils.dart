import 'package:shared_preferences/shared_preferences.dart';

String _keyLocation = 'location';
String _keyLatitude = 'latitude';
String _keyLongitude = 'longitude';

class SharedPref {
  static void saveLocation({required String location}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyLocation, location);
  }

  static void saveLatitudeLongitude({
    required String latitude,
    required String longitude,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyLatitude, latitude);
    await preferences.setString(_keyLongitude, longitude);
  }

  static Future<String?> getSavedLocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? savedLocation = preferences.getString(_keyLocation);
    return savedLocation;
  }

  static Future<String?> getSavedLatitude() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? savedLatitude = preferences.getString(_keyLatitude);
    return savedLatitude;
  }

  static Future<String?> getSavedLongitude() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? savedLongitude = preferences.getString(_keyLongitude);
    return savedLongitude;
  }

  static void removeSavedLocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove(_keyLocation);
    preferences.remove(_keyLatitude);
    preferences.remove(_keyLongitude);
  }
}
