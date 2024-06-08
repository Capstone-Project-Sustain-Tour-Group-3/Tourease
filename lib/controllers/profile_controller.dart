// Untuk base64 encoding
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tourease/model/edit_profile_request_model.dart';
import 'package:tourease/model/edit_profile_response_model.dart';
import 'package:tourease/model/profile_response_model.dart';
import 'package:tourease/pages/bottom_navbar/bottom_navbar.dart';
import 'package:tourease/services/profile_service.dart';
import 'package:tourease/utils/shared_preference_utils.dart';
import 'package:image/image.dart' as img;

class ProfileController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController namaLengkapController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nomorTeleponController = TextEditingController();
  TextEditingController kotaController = TextEditingController();
  TextEditingController provinsiController = TextEditingController();

  RxString jenisKelamin = 'Pria'.obs;
  RxInt selectedGender = 1.obs;
  Rx<XFile?> imageFile = Rx<XFile?>(null);

  void selectGender(int value) {
    selectedGender.value = value;
    jenisKelamin.value = value == 1 ? 'Pria' : 'Wanita';
  }

  final ProfileService service;

  ProfileController(this.service);

  Rxn<ProfileResponseModel> userData = Rxn<ProfileResponseModel>();
  Rxn<EditProfileResponseModel> editData = Rxn<EditProfileResponseModel>();

  RxBool isLoadingGetUser = false.obs;
  RxBool isLoadingEditUser = false.obs;

  void getUserData() async {
    isLoadingGetUser.value = true;
    try {
      final token = await SharedPref.getAccessToken();
      if (token != null) {
        final response = await service.getProfile(token);
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
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoadingGetUser.value = false;
    }
  }

  Future<void> editProfile() async {
    isLoadingEditUser.value = true;
    try {
      final token = await SharedPref.getAccessToken();
      final XFile? pickedFile = imageFile.value;
      List<int>? bytes;
      String? fileName;
      if (pickedFile != null) {
        bytes = await pickedFile.readAsBytes();
        bytes = await compressImage(bytes);
        fileName = pickedFile.path.split('/').last;
      }
      final requestModel = EditProfileRequestModel(
        username: usernameController.text,
        namaLengkap: namaLengkapController.text,
        bio: bioController.text.isEmpty ? "" : bioController.text,
        email: emailController.text,
        noTelepon: nomorTeleponController.text,
        jenisKelamin: jenisKelamin.value,
        kota: kotaController.text,
        provinsi: provinsiController.text,
      );

      final response =
          await service.editProfile(requestModel, token!, bytes, fileName);
      editData.value = response;
      Get.offAll(
        () => const BottomNavbar(
          initialIndex: 3,
        ),
      );
    } catch (e) {
      Get.snackbar('Error', 'Failed to edit profile: ${e.toString()}');
    } finally {
      isLoadingEditUser.value = false;
    }
  }

  void setImageFile(XFile? value) {
    imageFile.value = value;
  }

  onGalleryView() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setImageFile(pickedFile);
    }
  }

  Future<List<int>> compressImage(List<int> bytes) async {
    int imageLength = bytes.length;
    if (imageLength < 1000000) return bytes;
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
