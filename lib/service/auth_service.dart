import 'package:dio/dio.dart';
import 'package:tourease/model/user_model.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.tourease.my.id/v1',
    headers: {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    },
  ));

  Future<bool> register(UserModel user) async {
    try {
      final response = await _dio.post('/auth/register', data: user.toJson());

      if (response.statusCode == 201 && response.data['status'] == 'Success') {
        print('Registration successful: ${response.data['message']}');
        print('Reference ID: ${response.data['data']['reference_id']}');
        return true;
      } else {
        print('Failed to register: ${response.data['message']}');
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 409) {
        print('Error response: ${e.response?.data}');
        throw Exception(e.response?.data['message']);
      } else {
        print('Error sending request: ${e.message}');
        throw Exception(
            'Terdapat kesalahan dalam mengirim permintaan. Silakan coba lagi.');
      }
    }
  }
}
