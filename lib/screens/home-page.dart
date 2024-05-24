import 'package:ars_sonora/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n.t(TFile.common, "test")),
      ),
      body: ElevatedButton(
        onPressed: () {
          context.go('/search');
        },
        child: const Text('search'),
      ),
    );
  }
}
