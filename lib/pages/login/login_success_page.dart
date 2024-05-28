import 'package:flutter/material.dart';
import 'package:tourease/pages/login/login_back.dart';
import 'package:tourease/pages/login/login_success_banner.dart';
import 'package:tourease/pages/login/login_success_button.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginBack(),
                  LoginSuccessBanner(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: LoginSuccessButton(),
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
