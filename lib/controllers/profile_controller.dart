// Untuk base64 encoding
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourease/model/edit_profile_request_model.dart';
import 'package:tourease/model/edit_profile_response_model.dart';
import 'package:tourease/model/profile_response_model.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/pages/login/login_page.dart';
import 'package:tourease/services/profile_service.dart';
import 'package:tourease/services/refresh_token_and_logout_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:image/image.dart' as img;
import 'package:tourease/widgets/snackbar_widget.dart';

class ProfileController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();

  final errorMessageNamaPengguna = Rxn<String>();
  final errorMessageNamaLengkap = Rxn<String>();
  final errorMessageEmail = Rxn<String>();
  final errorMessageNomorTelepon = Rxn<String>();
  final errorMessagePassword = Rxn<String>();

  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  RxString jenisKelamin = 'Pria'.obs;
  RxInt selectedGender = 1.obs;
  Rx<XFile?> imageFile = Rx<XFile?>(null);
  RxString? imagePath = ''.obs;

  void selectGender(int value) {
    selectedGender.value = value;
    jenisKelamin.value = value == 1
        ? 'Pria'
        : value == 2
            ? 'Wanita'
            : '';
  }

  Rxn<ProfileResponseModel> userData = Rxn<ProfileResponseModel>();
  Rxn<EditProfileResponseModel> editData = Rxn<EditProfileResponseModel>();

  RxBool isLoadingGetUser = false.obs;
  RxBool isLoadingEditUser = false.obs;

  void getUserData() async {
    isLoadingGetUser.value = true;
    try {
      final token = await SharedPref.getAccessToken();

      if (token != null) {
        final response = await ProfileService().getProfile(token);
        userData.value = response;
        usernameController.text = response.data!.username!;
        namaLengkapController.text = response.data!.namaLengkap!;
        bioController.text = response.data!.bio!;
        emailController.text = response.data!.email!;
        nomorTeleponController.text = response.data!.noTelepon!;
        kotaController.text = response.data!.kota!;
        provinsiController.text = response.data!.provinsi!;
        jenisKelamin.value = response.data!.jenisKelamin!;
        selectedGender.value = response.data!.jenisKelamin! == 'Pria' ? 1 : 2;
      } else {
        throw Exception("Token is null");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          getUserData();
        } else {
          Get.snackbar('Error nih ', e.toString());
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingGetUser.value = false;
    }
  }

  Future<void> editProfile() async {
    isLoadingEditUser.value = true;
    try {
      if (errorMessageNamaPengguna.value != null) {
        SnackbarWidget.showSnackbar(message: 'Masukkan nama anda');
        return;
      } else if (errorMessageNamaLengkap.value != null) {
        SnackbarWidget.showSnackbar(message: 'Masukkan nama lengkap anda');
        return;
      } else if (errorMessageEmail.value != null) {
        SnackbarWidget.showSnackbar(message: 'Masukkan email anda');
        return;
      } else if (errorMessageNomorTelepon.value != null) {
        SnackbarWidget.showSnackbar(message: 'Masukkan nomor telepon anda');
        return;
      }

      final token = await SharedPref.getAccessToken();
      if (kDebugMode) {
        print("token nya itu ${token!}");
      }
      final XFile? pickedFile = imageFile.value;
      List<int>? bytes;
      String? fileName;
      List<int>? newBytes;
      if (pickedFile != null) {
        fileName = imageFile.value!.name;
        bytes = await imageFile.value?.readAsBytes();
        if (bytes != null) {
          Uint8List uint8Bytes = Uint8List.fromList(bytes);
          newBytes = await compressImage(uint8Bytes);
        }
      }

      final requestModel = EditProfileRequestModel(
        username: usernameController.text,
        namaLengkap: namaLengkapController.text,
        bio: bioController.text.isEmpty ? '' : bioController.text,
        email: emailController.text,
        noTelepon: nomorTeleponController.text,
        jenisKelamin: jenisKelamin.value,
        kota: kotaController.text,
        provinsi: provinsiController.text,
      );

      final response = await ProfileService()
          .editProfile(requestModel, token!, newBytes, fileName);
      editData.value = response;
      Get.offAll(
        () => const BottomNavbar(
          initialIndex: 3,
        ),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 500 &&
          e.response?.data['message'] == 'Token sudah kadaluwarsa') {
        final response = await RefreshTokenLogoutService().postRefreshToken();
        if (response == true) {
          editProfile();
        } else {
          Get.snackbar('Error', e.toString());
          SharedPref.removeAll();
          Get.offAll(() => LoginPage());
        }
      }
    } finally {
      isLoadingEditUser.value = false;
    }
  }

  void setImageFile(XFile? value) {
    imageFile.value = value;
  }

  void onGalleryView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setImageFile(pickedFile);
      setImagePath(pickedFile.path);
    }
  }

  Future<List<int>> compressImage(Uint8List bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 2000000) return bytes;
    final img.Image image = img.decodeImage(Uint8List.fromList(bytes))!;
    int compressQuality = 100;
    int length = imageLength;
    List<int> newByte = [];
    do {
      compressQuality -= 10;
      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );
      length = newByte.length;
    } while (length > 1000000);
    return newByte;
  }

  void validatorEmail(String value) {
    if (value.isEmpty) {
      errorMessageEmail.value = "Email tidak boleh kosong";
    } else if (!emailRegExp.hasMatch(value)) {
      errorMessageEmail.value = "Format email tidak valid";
    } else {
      errorMessageEmail.value = null;
    }
  }

  void validatorNamaPengguna(String value) {
    if (value.isEmpty) {
      errorMessageNamaPengguna.value = "Nama Pengguna tidak boleh kosong";
    } else if (value.length < 2) {
      errorMessageNamaPengguna.value = "Nama Pengguna harus lebih dari 2 huruf";
    } else if (value.contains(' ')) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna tidak boleh mengandung spasi";
    } else if (value.contains(RegExp(r'[!@#<>?":`~;[\]\\|=+)(*&^%-]'))) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna tidak boleh mengandung karakter khusus";
    } else if (value.contains(RegExp(r'[A-Z]'))) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna tidak boleh mengandung huruf kapital";
    } else if (value.length > 16) {
      errorMessageNamaPengguna.value =
          "Nama Pengguna harus kurang dari 16 huruf";
    } else {
      errorMessageNamaPengguna.value = null;
    }
  }

  void validatorNamaLengkap(String value) {
    if (value.isEmpty) {
      errorMessageNamaLengkap.value = "Nama Lengkap tidak boleh kosong";
    } else {
      errorMessageNamaLengkap.value = null;
    }
  }

  void validatorNomorTelepon(String value) {
    if (value.isEmpty) {
      errorMessageNomorTelepon.value = "Nomor Telepon tidak boleh kosong";
    } else if (value.length < 11) {
      errorMessageNomorTelepon.value =
          "Nomor Telepon harus lebih dari 11 angka";
    } else {
      errorMessageNomorTelepon.value = null;
    }
  }

  void setImagePath(String? value) {
    imagePath!.value = value!;
  }

  void onCameraView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setImageFile(pickedFile);
      setImagePath(pickedFile.path);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    namaLengkapController.dispose();
    bioController.dispose();
    emailController.dispose();
    nomorTeleponController.dispose();
    kotaController.dispose();
    provinsiController.dispose();
    super.dispose();
  }
}
