import 'package:ars_sonora/widgets/core/auth/login-form.dart';
import 'package:flutter/material.dart';

class NotAuthenticatedPage extends StatelessWidget {
  const NotAuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginForm();
  }
}
