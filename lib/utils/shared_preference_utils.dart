import 'package:shared_preferences/shared_preferences.dart';

String _keyLocation = 'location';
String _keyLatitude = 'latitude';
String _keyLongitude = 'longitude';
String _keySearchHistory = 'history';

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

  static void saveSearchHistory(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> searchHistory = await getSearchHistory();
    if (!searchHistory.contains(value)) {
      searchHistory.insert(0, value);
      await preferences.setStringList(_keySearchHistory, searchHistory);
    }
  }

  static Future<List<String>> getSearchHistory() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? searchHistory = preferences.getStringList(_keySearchHistory);
    return searchHistory ?? [];
  }

  static void deleteSearchHistory(int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> searchHistory = await getSearchHistory();
    searchHistory.removeAt(index);
    await preferences.setStringList(_keySearchHistory, searchHistory);
  }
}
