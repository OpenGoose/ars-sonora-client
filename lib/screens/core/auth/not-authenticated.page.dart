import 'package:ars_sonora/i18n/i18n.dart';
import 'package:ars_sonora/widgets/core/auth/login-form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotAuthenticatedPage extends StatelessWidget {
  const NotAuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n.t(TFile.authPage, 'Title')),
      ),
      body: const Padding(padding: EdgeInsets.all(24), child: LoginForm()),
    );
  }
}
