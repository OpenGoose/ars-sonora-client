import 'package:ars_sonora/hooks/core/auth/use-auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthComponentMiddleware extends HookWidget {
  final Widget authenticated, notAuthenticated;

  AuthComponentMiddleware(
      {super.key, required this.authenticated, required this.notAuthenticated});

  final auth = useAuth();

  @override
  Widget build(BuildContext context) {
    if (auth.isAuthenticated) return authenticated;
    return notAuthenticated;
  }
}
