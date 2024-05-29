import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class SearchTextFormFieldWidget extends StatelessWidget {
  const SearchTextFormFieldWidget({
    super.key,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.hintTextColor,
    this.contentPadding,
    this.autofocus,
    this.readOnly,
    this.controller,
    this.onFieldSubmitted,
    this.cursorColor,
    this.suffixIcon,
    this.prefixIcon,
    this.initialValue,
  });

  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? hintTextColor;
  final EdgeInsetsGeometry? contentPadding;
  final bool? autofocus;
  final bool? readOnly;
  final TextEditingController? controller;
  final void Function(String)? onFieldSubmitted;
  final Color? cursorColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onFieldSubmitted: onFieldSubmitted,
      readOnly: readOnly ?? false,
      autofocus: autofocus ?? false,
      style: TextStyleCollection.caption.copyWith(
        color: ColorNeutral.neutral900,
        fontSize: 14,
      ),
      cursorColor: cursorColor,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        hintText: 'Cari destinasi...',
        hintStyle: TextStyleCollection.caption.copyWith(
          color: hintTextColor ?? ColorCollection.gray2,
          fontSize: 14,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: enabledBorderColor ?? ColorCollection.gray2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: focusedBorderColor ?? ColorCollection.gray2,
          ),
        ),
      ),
    );
  }
}
