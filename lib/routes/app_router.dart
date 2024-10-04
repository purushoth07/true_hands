import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

//mobile screens
import 'package:truehands/presentation/screens/mobile/authentication/login.dart';
import 'package:truehands/presentation/screens/mobile/authentication/forget_password.dart';
import 'package:truehands/presentation/screens/mobile/authentication/reset_password.dart';
import 'package:truehands/presentation/screens/mobile/onboard/bottom_bar.dart';
import 'package:truehands/presentation/screens/mobile/profile/edit_profile.dart';
import 'package:truehands/presentation/screens/mobile/profile/profile.dart';
import 'package:truehands/presentation/screens/mobile/emergency.dart';


//web screens
import 'package:truehands/presentation/screens/web/login.dart';

import 'package:truehands/presentation/screens/mobile/onboard/notifications.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => _getLoginPage(),
        );
      case '/weblogin':
        return MaterialPageRoute(
          builder: (_) => WebLogin(),
        );
      case '/mobilelogin':
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case '/forgetpassword':
        return MaterialPageRoute(
          builder: (_) => const ForgetPassword(),
        );
      case '/resetpassword':
        return MaterialPageRoute(
          builder: (_) => const ResetPassword(),
        );
      case '/homepage':
        return MaterialPageRoute(
          builder: (_) => HomePage(),
        );
      case '/notifications':
        return MaterialPageRoute(
          builder: (_) => NotificationsPage(),
        );
      case '/profile':
        return MaterialPageRoute(
          builder: (_) => ProfilePage(),
        );
      case '/edit_profile':
        return MaterialPageRoute(
          builder: (_) => EditProfilePage(),
        );
      case '/emergency':
        return MaterialPageRoute(
          builder: (_) => EmergencyPage(),
        );
      default:
        return null;
    }
  }

  Widget _getLoginPage() {
    if (kIsWeb) {
      return WebLogin();
    } else{
      return LoginPage();
    }
  }
}
