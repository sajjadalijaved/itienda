import 'dart:developer';
import 'package:flutter/material.dart';
import 'SplashScreenModel/splash_services.dart';
import 'package:itienda/config/localStorage/local_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    super.initState();
    getRole().then(
      (value) {
        log("role in splash:$value");
        splashServices.checkAuthentication(context, value);
      },
    );
  }

  Future<dynamic> getRole() async {
    try {
      var role = await localStorage.getValue("role");

      return role;
    } catch (e) {
      log("Get role Error:${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    // mediaQuery add
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
        body: SafeArea(
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.png"),
            fit: BoxFit.fill,
          ),
        ),
      ),
    ));
  }
}
