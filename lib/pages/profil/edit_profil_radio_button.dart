import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/profile_controller.dart';

class EditProfilRadioButton extends StatelessWidget {
  const EditProfilRadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    final editProfilController = Get.put(ProfileController());
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Radio(
            value: 1,
            activeColor: ColorCollection.gray,
            groupValue: editProfilController.selectedGender.value,
            onChanged: (value) {
              if (value != null) {
                editProfilController.selectGender(value);
              }
            },
          ),
          Text(
            'Pria',
            style: TextStyleCollection.caption
                .copyWith(color: ColorCollection.gray3),
          ),
          Radio(
            value: 2,
            groupValue: editProfilController.selectedGender.value,
            activeColor: ColorCollection.gray,
            onChanged: (value) {
              if (value != null) {
                editProfilController.selectGender(value);
              }
            },
          ),
          Text(
            'Wanita',
            style: TextStyleCollection.caption
                .copyWith(color: ColorCollection.gray3),
          ),
        ],
      ),
    );
  }
}
