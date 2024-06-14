import 'package:dio/dio.dart';
import 'package:tourease/model/home_response_model.dart';
import 'package:tourease/utils/base_url.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class HomeService {
  static Dio dio = Dio();

  static Future<HomeResponseModel> getHomeData(
      {required String provinsi}) async {
    final token = await SharedPref.getAccessToken();
    final response = await dio.get(
      '${BaseUrl.urlAPI}/home?provinsi=$provinsi',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      }),
    );
    return HomeResponseModel.fromJson(response.data);
  }
}
