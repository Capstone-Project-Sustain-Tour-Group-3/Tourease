import 'package:dio/dio.dart';
import 'package:tourease/model/refresh_token_response_model.dart';
import 'package:tourease/utils/base_url.dart';
import 'package:tourease/utils/shared_preference_utils.dart';

class RefreshTokenLogoutService {
  final Dio dio = Dio();

  Future<bool> postRefreshToken() async {
    try {
      final refreshToken = await SharedPref.getRefreshToken();
      final response = await dio.post(
        '${BaseUrl.urlAPI}/auth/token',
        data: {
          'refresh_token': refreshToken,
        },
      );

      if (response.statusCode == 200) {
        final refreshTokenResponse =
            RefreshTokenResponseModel.fromJson(response.data);
        SharedPref.saveAccessToken(
          token: refreshTokenResponse.data?.accessToken ?? '',
        );
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      final refreshToken = await SharedPref.getRefreshToken();
      final response = await dio.delete(
        '${BaseUrl.urlAPI}/auth/logout',
        data: {
          'refresh_token': refreshToken,
        },
      );
      if (response.statusCode == 200) {
        SharedPref.removeAll();
      } else {
        SharedPref.removeAll();
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
