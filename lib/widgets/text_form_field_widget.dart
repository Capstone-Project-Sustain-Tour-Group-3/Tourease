import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.titleForm,
    required this.hintText,
  });

  final String titleForm;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          titleForm,
          style: TextStyleCollection.bodyBold.copyWith(
            color: ColorPrimary.primary900,
          ),
          minFontSize: 16,
          maxFontSize: 18,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          style: TextStyleCollection.caption.copyWith(
            fontSize: 14,
            color: ColorNeutral.neutral700,
          ),
          decoration: InputDecoration(
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
        )
      ],
    );
  }
}
