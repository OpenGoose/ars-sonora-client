import 'package:ars_sonora/i18n/i18n.dart';
import 'package:ars_sonora/widgets/core/auth/login-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotAuthenticatedPage extends StatelessWidget {
  const NotAuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/branding/logo.png'),
                    width: 200,
                  ),
                  LoginForm()
                ],
              ),
              Text(I18n.t(TFile.authPage, 'Message'))
            ],
          )),
      resizeToAvoidBottomInset: false,
    );
  }
}
