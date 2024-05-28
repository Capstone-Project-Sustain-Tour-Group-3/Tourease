// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:tourease/model/user_model.dart';
// import 'package:get/get.dart';

// class AuthService {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'https://api.tourease.my.id/v2',
//     headers: {
//       'accept': 'application/json',
//       'Content-Type': 'application/json',
//     },
//   ));

//   Future<String> register(UserModel user) async {
//     try {
//       final response = await _dio.post('/auth/register', data: user.toJson());
//       if (response.statusCode == 201 && response.data['status'] == 'Success') {
//         return response.data['data']['reference_id'];
//       } else {
//         throw Exception(response.data['message']);
//       }
//     } on DioException catch (e) {
//       if (e.response != null && e.response?.statusCode == 409) {
//         throw Exception(e.response?.data['message']);
//       } else {
//         print('Error sending request: ${e.message}');
//         throw Exception(
//             'Terdapat kesalahan dalam mengirimkan permintaan, silahkan coba lagi');
//       }
//     }
//   }

//   Future<void> verifyOtp(String refId, String otp) async {
//     try {
//       final response = await _dio.post(
//         '/auth/verify',
//         data: {
//           'ref_id': refId,
//           'otp': otp,
//         },
//       );

//       if (response.statusCode == 200 && response.data['status'] == 'Success') {
//         print('OTP verification successful: ${response.data['message']}');
//       } else {
//         print('Failed to verify OTP: ${response.data['message']}');
//         throw Exception(response.data['message']);
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         print('Error response: ${e.response?.data}');
//         throw Exception(e.response?.data['message']);
//       } else {
//         print('Error sending request: ${e.message}');
//         throw Exception('Failed to send request');
//       }
//     }
//   }

//   Future<String> resendOtp(String email) async {
//     try {
//       final response = await _dio.post(
//         '/auth/resend-otp',
//         data: {
//           'email': email,
//         },
//       );

//       if (response.statusCode == 201 && response.data['status'] == 'Success') {
//         print('OTP resend successful: ${response.data['message']}');
//         return response.data['data']['reference_id'];
//       } else {
//         print('Failed to resend OTP: ${response.data['message']}');
//         throw Exception(response.data['message']);
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         print('Error response: ${e.response?.data}');
//         throw Exception(e.response?.data['message']);
//       } else {
//         print('Error sending request: ${e.message}');
//         throw Exception('Failed to send request');
//       }
//     }
//   }
// }
