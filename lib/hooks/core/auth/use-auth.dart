import 'package:ars_sonora/models/core/auth/user.model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AuthInfo {
  String accessToken;
  UserModel user;

  AuthInfo({required this.accessToken, required this.user});
}

_UseAuth useAuth() {
  final authInfo = useState<AuthInfo?>(null);
  final isAuthenticated = authInfo.value != null;

  useEffect(() {
    // Update device storage data
  }, [authInfo]);

  Future<AuthInfo?> login() async {
    return null;
  }

  return _UseAuth(
      login: login, authInfo: authInfo.value, isAuthenticated: isAuthenticated);
}

class _UseAuth {
  final Future<AuthInfo?> Function() login;
  final AuthInfo? authInfo;
  final bool isAuthenticated;

  _UseAuth(
      {required this.login,
      required this.isAuthenticated,
      required this.authInfo});
}
