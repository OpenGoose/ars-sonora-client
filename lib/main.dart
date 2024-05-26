import 'package:ars_sonora/i18n/i18n.dart';
import 'package:ars_sonora/widgets/core/base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  I18n.setup({
    Language.en_US: {
      TFile.layout:
          await rootBundle.loadString('assets/i18n/locales/en_US/layout.json'),
      TFile.common:
          await rootBundle.loadString('assets/i18n/locales/en_US/common.json'),
      TFile.authPage: await rootBundle
          .loadString('assets/i18n/locales/en_US/auth-page.json'),
    }
  });

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Base();
  }
}
