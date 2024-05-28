import 'package:flutter/material.dart';
import 'package:tourease/pages/login/forget_password_for_email_banner.dart';
import 'package:tourease/pages/login/forget_password_for_email_button.dart';
import 'package:tourease/pages/login/forget_password_for_email_form.dart';
import 'package:tourease/pages/login/login_back.dart';

class ForgetPasswordForEmailPage extends StatelessWidget {
  const ForgetPasswordForEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginBack(),
                  const ForgetPasswordForEmailBanner(),
                  ForgetPasswordForEmailForm(),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: ForgetPasswordForEmailButton(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}