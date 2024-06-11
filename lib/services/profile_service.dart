import 'package:dio/dio.dart';
import 'package:tourease/model/change_password_response_model.dart';
import 'package:tourease/model/edit_profile_request_model.dart';
import 'package:tourease/model/edit_profile_response_model.dart';
import 'package:tourease/model/profile_response_model.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/base_url.dart';

class ProfileService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: BaseUrl.urlAPI,
      headers: {
        'accept': 'application/json',
      },
    ),
  );

  Future<ProfileResponseModel> getProfile(String token) async {
    try {
      final response = await _dio.get(
        '/profile',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ProfileResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load profile');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final refreshTokenResponse =
            await RefreshTokenLogoutService().postRefreshToken();
        if (refreshTokenResponse == true) {
          return getProfile(token);
        } else {
          throw DioException(
            requestOptions: e.requestOptions,
            response: e.response,
            error: 'Failed to refresh token',
          );
        }
      } else {
        throw DioException(
          requestOptions: e.requestOptions,
          response: e.response,
          error: 'Failed to load profile: ${e.message}',
        );
      }
    }
  }

  Future<EditProfileResponseModel> editProfile(
    EditProfileRequestModel requestModel,
    String token,
    List<int>? bytes,
    String? fileName,
  ) async {
    try {
      FormData formData = FormData();

      formData.fields
        ..add(MapEntry('username', requestModel.username!))
        ..add(MapEntry('nama_lengkap', requestModel.namaLengkap!))
        ..add(MapEntry('bio', requestModel.bio!))
        ..add(MapEntry('email', requestModel.email!))
        ..add(MapEntry('no_telepon', requestModel.noTelepon!))
        ..add(MapEntry('jenis_kelamin', requestModel.jenisKelamin!))
        ..add(MapEntry('kota', requestModel.kota!))
        ..add(MapEntry('provinsi', requestModel.provinsi!));

      if (bytes != null && fileName != null) {
        formData.files.add(MapEntry(
          'foto_profil',
          MultipartFile.fromBytes(
            bytes,
            filename: fileName,
          ),
        ));
      }

      final response = await _dio.put(
        '/profile',
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        return EditProfileResponseModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to edit profile: status code ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Failed to edit profile: ${e.message}');
    } catch (e) {
      throw Exception('Failed to edit profile: $e');
    }
  }

  Future<ChangePasswordResponseModel> changePassword(String token,
      String oldPassword, String newPassword, String confirmPassword) async {
    try {
      final response = await _dio.put(
        '/profile/change-password',
        data: {
          'password_lama': oldPassword,
          'password_baru': newPassword,
          'konfirmasi_password': confirmPassword,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ChangePasswordResponseModel.fromJson(response.data);
      } else {
        return ChangePasswordResponseModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        print('Failed to change password: ${e.response!.data}');
        return ChangePasswordResponseModel.fromJson(e.response!.data);
      } else {
        print('Failed to change password: ${e.message}');
        return ChangePasswordResponseModel(
          status: 'Failed',
          message: 'Failed to change password: ${e.message}',
        );
      }
    }
  }
}
