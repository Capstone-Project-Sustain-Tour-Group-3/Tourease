import 'package:dio/dio.dart';
import 'package:tourease/model/profile_saved_route_detail_response_model.dart';
import 'package:tourease/model/profile_saved_route_response_model.dart';
import 'package:tourease/utils/base_url.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class SavedRouteService {
  static Dio dio = Dio();

  static Future<SavedRouteProfileResponse> getSavedRoute() async {
    final token = await SharedPref.getAccessToken();
    final response = await dio.get(
      '${BaseUrl.urlAPI}/profile/routes',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    return SavedRouteProfileResponse.fromJson(response.data);
  }

  static Future<DetailSavedRouteResponse> getDetailSavedRoute(
      {required String id}) async {
    final token = await SharedPref.getAccessToken();
    final response = await dio.get(
      '${BaseUrl.urlAPI}/profile/routes/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
    return DetailSavedRouteResponse.fromJson(response.data);
  }

  static Future<void> deleteSavedRoute({required String id}) async {
    final token = await SharedPref.getAccessToken();
    await dio.delete(
      '${BaseUrl.urlAPI}/profile/routes/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      ),
    );
  }
}
