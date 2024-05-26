import 'package:ars_sonora/hooks/core/network/http/use-query.dart';
import 'package:ars_sonora/i18n/i18n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginForm extends HookWidget {
  LoginForm({super.key});

  Future<void> sleepOneSecond() async {
    await Future.delayed(Duration(seconds: 3));
    print('Slept for 1 second');
  }

  @override
  Widget build(BuildContext context) {
    final testRequest = useQuery(UseQueryOptions(queryFn: () async {
      await sleepOneSecond();
      return await Dio().request<String>('https://google.com',
          options: Options(method: "get"));
    }));

    print(testRequest.isLoading);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        testRequest.isLoading ? Text("loading") : Text("DONE"),
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
