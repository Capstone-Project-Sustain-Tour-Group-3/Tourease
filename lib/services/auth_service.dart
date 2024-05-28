import 'package:dio/dio.dart';
import 'package:tourease/model/login_response_model.dart';

class AuthService {
  static final Dio dio = Dio();

  static Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'https://api.tourease.my.id/v1/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw '$e';
    }
  }
}
