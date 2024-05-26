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
        const TextField(
          decoration: InputDecoration(labelText: 'login'),
        ),
        const TextField(
          decoration: InputDecoration(labelText: 'password'),
          obscureText: true,
        ),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: const Text("Login")))
      ]
          .map((w) => Padding(
                padding: const EdgeInsets.all(6),
                child: w,
              ))
          .toList(),
    );
  }
}
