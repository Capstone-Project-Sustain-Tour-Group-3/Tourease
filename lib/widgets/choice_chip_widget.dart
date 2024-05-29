import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/constants/text_style_constant.dart';

class ChoiceChipWidget extends StatelessWidget {
  const ChoiceChipWidget({
    super.key,
    required this.isSelected,
    required this.onSelected,
    required this.labelText,
  });

  final bool isSelected;
  final void Function(bool) onSelected;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        labelText,
        style: TextStyleCollection.caption.copyWith(
          fontSize: 14,
          color: isSelected ? ColorNeutral.neutral50 : ColorPrimary.primary900,
        ),
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      selected: isSelected,
      selectedColor: ColorPrimary.primary500,
      backgroundColor: ColorNeutral.neutral100,
      onSelected: onSelected,
      showCheckmark: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      side: BorderSide(
        color: isSelected ? ColorPrimary.primary500 : ColorNeutral.neutral100,
      ),
    );
  }
}
