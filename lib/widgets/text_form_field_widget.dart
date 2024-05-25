import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';
import 'package:tourease/controllers/text_form_field_widget_controller.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.titleForm,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.errorText,
    required this.isPassword,
    this.colorTitleText,
  });

  final String titleForm;
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? errorText;
  final bool isPassword;
  final Color? colorTitleText;

  @override
  Widget build(BuildContext context) {
    final TextFormFieldWidgetController textFormFieldWidgetController = Get.put(
      TextFormFieldWidgetController(),
      tag: titleForm,
    );

    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              titleForm,
              style: TextStyleCollection.bodyBold.copyWith(
                  color: textFormFieldWidgetController.isFocused.value == true
                      ? (textFormFieldWidgetController
                              .handleErrorForm(errorText)
                          ? ColorDanger.danger500
                          : ColorPrimary.primary500)
                      : textFormFieldWidgetController.handleErrorForm(errorText)
                          ? ColorDanger.danger500
                          : ColorNeutral.neutral700),
              minFontSize: 16,
              maxFontSize: 18,
            ),
            const SizedBox(
              height: 8,
            ),
            Focus(
              onFocusChange: (focus) {
                textFormFieldWidgetController.handleFocusChange(focus);
              },
              child: TextFormField(
                controller: controller,
                onChanged: onChanged,
                obscureText: isPassword
                    ? textFormFieldWidgetController.obscureText.value
                    : false,
                style: TextStyleCollection.caption.copyWith(
                  fontSize: 14,
                  color: ColorNeutral.neutral700,
                ),
                decoration: InputDecoration(
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            textFormFieldWidgetController.obscureText.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorNeutral.neutral500,
                          ),
                          onPressed: () {
                            textFormFieldWidgetController.obscureText.toggle();
                          },
                        )
                      : null,
                  errorText: errorText,
                  filled: true,
                  fillColor: Colors.white,
                  hintText: hintText,
                  hintStyle: TextStyleCollection.caption.copyWith(
                    fontSize: 12,
                    color: ColorNeutral.neutral500,
                  ),
                  contentPadding: const EdgeInsets.all(16),
                  border: UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      color: ColorNeutral.neutral500,
                      width: 2,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      color: ColorPrimary.primary500,
                      width: 2,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      color: ColorDanger.danger500,
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4),
                    ),
                    borderSide: BorderSide(
                      color: ColorDanger.danger500,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
