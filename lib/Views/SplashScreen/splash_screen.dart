import 'dart:async';
import 'package:flutter/material.dart';
import '../AuthenticationScreens/login.dart';
import 'package:itienda/Widgets/connectivity_check.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//   SplashServices splashServices = SplashServices();
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   String token = '';

//   // get token
//   Future<String> getToken() async {
//     await messaging.getToken().then((value) {
//       if (value != null) {
//         setState(() {
//           token = value;
//         });
//         log('Push Token: $token');
//       }
//     });
//     return token;
//   }

// // save token
//   Future<String> _tokenSaver() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('token', token);

//     return 'saved';
//   }

// // token get through sharePreferences
//   _tokenRetriever() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String storeToken = prefs.getString('token') ?? '';

//     log("Get Token in splashScreen: $storeToken");
//   }

  @override
  void initState() {
    super.initState();
    // getToken().then((value) {
    //   _tokenSaver().then((_) {
    //     _tokenRetriever();
    //   });
    //   splashServices.checkAuthentication(context);
    // });
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CheckConnectivity(
              child: LoginScreen(),
            ),
          ),
          (route) => false);
    });
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
