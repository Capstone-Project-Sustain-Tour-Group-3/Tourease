import 'package:shared_preferences/shared_preferences.dart';

String _keyLocation = 'location';
String _keyCompletedLocation = 'completed_location';
String _keyLatitude = 'latitude';
String _keyLongitude = 'longitude';
String _keySearchHistory = 'history';
String _keyAccessToken = 'access_token';
String _keyRefreshToken = 'refresh_token';

class SharedPref {
  static void saveLocation({required String location}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyLocation, location);
  }

  static void saveCompletedLocation({required String completedLocation}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyCompletedLocation, completedLocation);
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

  static Future<String?> getSavedCompletedLocation() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? savedCompletedLocation =
        preferences.getString(_keyCompletedLocation);
    return savedCompletedLocation;
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

  static void saveAccessToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyAccessToken, token);
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(_keyAccessToken);
    return token;
  }

  static void saveRefreshToken({required String resfreshToken}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyRefreshToken, resfreshToken);
  }

  static Future<String?> getRefreshToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(_keyRefreshToken);
    return token;
  }

  static void removeAccessToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.remove(_keyAccessToken);
  }

  static void removeAll() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.clear();
  }
}
