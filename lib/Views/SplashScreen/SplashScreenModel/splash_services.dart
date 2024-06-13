import 'dart:async';
import 'package:flutter/material.dart';
import 'package:itienda/Views/main_screen.dart';
import 'package:itienda/config/sessionManager/session_manager.dart';
import 'package:itienda/Views/jobseeker/AuthenticationScreens/login.dart';
import 'package:itienda/Views/businessOwner/main_screen_business_owner.dart';

class SplashServices {
  void checkAuthentication(BuildContext context, dynamic role) async {
    SessionManager().getsaveUserInPreferance().then((value) async {
      if (SessionManager.isLoging ?? false) {
        if (role == '2') {
          Timer(
            const Duration(seconds: 2),
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreenBusinessOwner(),
                ),
                (route) => false,
              );
            },
          );
        } else if (role == '1') {
          Timer(
            const Duration(seconds: 2),
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ),
                (route) => false,
              );
            },
          );
        }
      } else {
        Timer(
          const Duration(seconds: 2),
          () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            );
          },
        );
      }
    }).onError((error, stackTrace) {
      Timer(
        const Duration(seconds: 2),
        () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        },
      );
    });
  }
}
