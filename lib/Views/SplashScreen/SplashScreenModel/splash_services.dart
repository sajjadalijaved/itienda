import 'dart:async';
import 'package:flutter/material.dart';
import 'package:itienda/Views/main_screen.dart';
import 'package:itienda/Widgets/connectivity_check.dart';
import 'package:itienda/Views/AuthenticationScreens/login.dart';
import 'package:itienda/config/sessionManager/session_manager.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) async {
    SessionManager().getsaveUserInPreferance().then((value) async {
      if (SessionManager.isLoging ?? false) {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const CheckConnectivity(child: MainScreen()),
              ),
              (route) => false),
        );
      } else {
        Timer(
          const Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const CheckConnectivity(child: LoginScreen()),
              ),
              (route) => false),
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  const CheckConnectivity(child: LoginScreen()),
            ),
            (route) => false),
      );
    });
  }
}
