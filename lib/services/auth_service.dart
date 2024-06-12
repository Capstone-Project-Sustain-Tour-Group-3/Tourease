import 'dart:async';
import 'package:dio/dio.dart';
import 'package:tourease/model/user_model.dart';
import 'package:tourease/model/login_response_model.dart';
import 'package:tourease/utils/base_url.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BaseUrl.urlAPI,
      headers: {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // Register Method
  Future<String> register(UserModel user) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: user.toJson(),
      );
      if (response.statusCode == 201 && response.data['status'] == 'Success') {
        return response.data['data']['reference_id'];
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 409) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception(
            'Terdapat kesalahan dalam mengirimkan permintaan, silahkan coba lagi');
      }
    }
  }

  // Verify OTP Method
  Future<void> verifyOtp(String refId, String otp) async {
    try {
      final response = await _dio.post(
        '/auth/verify',
        data: {
          'ref_id': refId,
          'otp': otp,
        },
      );

      if (response.statusCode == 200 && response.data['status'] == 'Success') {
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('Failed to send request');
      }
    }
  }

  // Resend OTP Method
  Future<String> resendOtp(String email) async {
    try {
      final response = await _dio.post(
        '/auth/resend-otp',
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 201 && response.data['status'] == 'Success') {
        return response.data['data']['reference_id'];
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('Failed to send request');
      }
    }
  }

// Login Method
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
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

  Future<String> newPassword(
      String refId, String password, String confirmPassword) async {
    try {
      final response = await _dio.put(
        '/auth/forgot-password',
        data: {
          'ref_id': refId,
          'password': password,
          'konfirmasi_password': confirmPassword,
        },
      );

      if (response.statusCode == 200 && response.data['status'] == 'Success') {
        return response.data['message'];
      } else {
        throw Exception(response.data['message']);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception(e.response?.data['message']);
      } else {
        throw Exception('Failed to send request');
      }
    }
  }
}
