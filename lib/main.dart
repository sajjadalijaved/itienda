import 'firebase_options.dart';
import 'config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets/connectivity_check.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Bloc/JobSeekerBloc/conectivityBloc/connectivity_bloc.dart';
import 'package:itienda/Views/businessOwner/main_screen_business_owner.dart';
import 'package:itienda/Bloc/JobSeekerBloc/loginBloc/googleLoginBloc/google_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectivityBloc>(
          create: (context) => ConnectivityBloc(),
        ),
        BlocProvider(
          create: (context) => GoogleLoginBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'iTIENDA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF006341)),
        ),
        onGenerateRoute: Routes.generateRoutes,
        home: CheckConnectivity(
          child: MainScreenBusinessOwner(
            businessName: "abc",
          ),
        ),
      ),
    );
  }
}
