import 'package:ars_sonora/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginForm extends HookWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
              labelText:
                  I18n.t(TFile.authPage, 'forms.login.fields.login.Label')),
        ),
        TextField(
          decoration: InputDecoration(
              labelText:
                  I18n.t(TFile.authPage, 'forms.login.fields.password.Label')),
          obscureText: true,
        ),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(I18n.t(TFile.authPage, 'forms.login.Submit'))))
      ]
          .map((w) => Padding(
                padding: const EdgeInsets.all(6),
                child: w,
              ))
          .toList(),
    );
  }
}
