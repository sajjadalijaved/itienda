import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Widgets/connectivity_check.dart';
import 'package:itienda/Views/jobseeker/home_screen.dart';
import '../../Widgets/BottomNavigationBar/JobSeeker/custom_bottom_bar.dart';
import 'package:itienda/Views/jobseeker/ProfileScreens/profile_screen.dart';
import 'package:itienda/Views/jobseeker/CategoryScreens/categories_screen.dart';
import 'package:itienda/Bloc/JobSeekerBloc/bottomNavigatonBarBloc/bottom_nav_bar_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late BottomNavBarBloc bottomNavBarBloc;
  List<String> icons = [
    "assets/home.png",
    "assets/category.png",
    "assets/user.png",
  ];

  List<String> lables = [
    "Inicio",
    "Categorías",
    "Perfil",
  ];

  @override
  void initState() {
    super.initState();
    bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  void dispose() {
    bottomNavBarBloc.close();
    super.dispose();
  }

  Widget _getBody(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return const CheckConnectivity(child: HomeScreen());
      case 1:
        return const CheckConnectivity(child: CategoriesScreen());
      case 2:
        return const CheckConnectivity(child: ProfileScreen());

      default:
        return const Center(child: Text('Unknown Screen'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarBloc(),
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarStates>(
        buildWhen: (previous, current) => current.tabIndex != previous.tabIndex,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Stack(
                children: [
                  _getBody(state.tabIndex),
                  Positioned(
                      bottom: 0,
                      child: BottomBar(
                        tabIndex: state.tabIndex,
                        context: context,
                        icons: icons,
                        lables: lables,
                      ))
                ],
              ),
            ),
            // bottomNavigationBar:
            //     BottomBar(tabIndex: state.tabIndex, context: context),
          );
        },
      ),
    );
  }
}


// Stack(
//                 children: [
//                   Consumer<MainScreenViewModel>(
//                       builder: (context, value, child) =>
//                           mainScreenViewModel.currentScreen),
//                   Positioned(
//                       bottom: 0,
//                       child: BottomBar(
//                         mainScreenViewModel: mainScreenViewModel,
//                       ))
//                 ],
//               ),