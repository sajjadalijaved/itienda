import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itienda/Widgets/connectivity_check.dart';
import 'package:itienda/Views/businessOwner/business_add.dart';
import 'package:itienda/Views/businessOwner/home_business_owner.dart';
import 'package:itienda/Views/businessOwner/business_owner_profile.dart';
import 'package:itienda/Widgets/BottomNavigationBar/BusinessOwner/custom_bottom_bar.dart';
import 'package:itienda/Bloc/JobSeekerBloc/bottomNavigatonBarBloc/bottom_nav_bar_bloc.dart';

// ignore_for_file: must_be_immutable

class MainScreenBusinessOwner extends StatefulWidget {
  String? businessName;
  MainScreenBusinessOwner({super.key, this.businessName});

  @override
  State<MainScreenBusinessOwner> createState() =>
      _MainScreenBusinessOwnerState();
}

class _MainScreenBusinessOwnerState extends State<MainScreenBusinessOwner> {
  late BottomNavBarBloc bottomNavBarBloc;
  List<String> icons = [
    "assets/home.png",
    "assets/add.png",
    "assets/images/message1.png",
    "assets/user.png",
  ];

  List<String> lables = [
    "Inicio",
    "Agregar Vacante",
    "Mensajes",
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
        return CheckConnectivity(
            child: HomeScreenBusinessOwner(
          businessName: widget.businessName!,
        ));
      case 1:
        return const CheckConnectivity(child: BusinessAadd());
      case 2:
        return const CheckConnectivity(child: EditProfileScreenBusinessOwner());
      case 3:
        return const CheckConnectivity(child: EditProfileScreenBusinessOwner());
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
                      child: BottomBarBusinessOwner(
                        tabIndex: state.tabIndex,
                        context: context,
                        icons: icons,
                        lables: lables,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
