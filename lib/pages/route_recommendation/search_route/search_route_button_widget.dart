import 'package:flutter/material.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

class SearchRouteButton extends StatelessWidget {
  const SearchRouteButton({
    super.key,
    required this.isEnabled,
    this.onPressed,
  });

  final bool isEnabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16, top: 18, right: 16, bottom: 24.0),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: isEnabled ? onPressed : null,
          text: 'Buat Perjalanan',
          textColor: ColorNeutral.neutral100,
          backgroundColor:
              isEnabled ? ColorPrimary.primary500 : ColorNeutral.neutral300,
        ),
      ),
    );
  }
}
