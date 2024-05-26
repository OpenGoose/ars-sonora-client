import 'package:ars_sonora/hooks/core/network/http/use-query.dart';
import 'package:ars_sonora/i18n/i18n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginForm extends HookWidget {
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final testRequest = useQuery<int>(UseQueryOptions(queryFn: () async {
      return await Dio().request<int>('http://localhost:5000/auth/login',
          options: Options(method: "post"));
    }));

    print(testRequest.isLoading);

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
