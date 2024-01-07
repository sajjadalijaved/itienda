import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/bloc/connectivity_bloc.dart';
import 'package:itienda/Views/AuthenticationScreens/login.dart';

class CheckConnectivitySplashScreen extends StatelessWidget {
  const CheckConnectivitySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return const SplashScreen();
        } else if (state is DisConnectedState) {
          return const Center(child: Text("No Internet! Please Try Again"));
        } else {
          return Container();
        }
      },
    );
  }
}

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
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CheckConnectivityLogin(),
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
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.10),
              child: SizedBox(
                height: height * 0.15,
                width: width,
                child: Image.asset(
                  "assets/splash.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.18),
              child: SizedBox(
                height: height * 0.05,
                width: width,
                child: Row(
                  children: [
                    const Text(
                      "Bienvenido(a)!",
                      style: TextStyle(
                          color: Color(
                            0xFF000000,
                          ),
                          fontSize: 30,
                          fontFamily: "Regular",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Image.asset(
                      "assets/emoji.png",
                      fit: BoxFit.cover,
                      height: height * 0.034,
                      width: width * 0.074,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
