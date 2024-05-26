import 'package:flutter/widgets.dart';
import 'package:tourease/constants/color_constant.dart';
import 'package:tourease/widgets/button_widget.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key, 
    required this.text, 
    required this.onPressed, 
    this.isEnabled = true,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: ButtonWidget(
          onPressed: isEnabled ? onPressed : () {},
          text: text,
          textColor: ColorNeutral.neutral100,
          backgroundColor: isEnabled ? ColorPrimary.primary500 : ColorNeutral.neutral400,
        ),
      ),
    );
  }
}
