import 'routes_name.dart';
import 'package:flutter/material.dart';
import '../../Views/SplashScreen/splash_screen.dart';
import 'package:itienda/Widgets/connectivity_check.dart';
import '../../Views/jobseeker/AuthenticationScreens/login.dart';
import '../../Views/jobseeker/AuthenticationScreens/signupscreen.dart';
import '../../Views/jobseeker/ForgetPassword/forget_password_screen.dart';

class Routes {
  static Route<dynamic>? generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const CheckConnectivity(child: SplashScreen()),
        );
      case RoutesName.loginScreen:
        return MaterialPageRoute(
            builder: (context) => const CheckConnectivity(child: LoginScreen()),
            settings: routeSettings);
      case RoutesName.signUpScreen:
        return MaterialPageRoute(
            builder: (context) =>
                const CheckConnectivity(child: SignUpScreen()),
            settings: routeSettings);

      case RoutesName.forgetPassword:
        return MaterialPageRoute(
            builder: (context) => const ForgetPasswordScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route define'),
            ),
          ),
        );
    }
  }
}
