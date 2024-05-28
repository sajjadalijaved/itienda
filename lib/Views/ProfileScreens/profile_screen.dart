import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:itienda/Utils/appcolors.dart';
import 'package:itienda/Widgets/text_widget.dart';
import 'package:itienda/Views/ProfileScreens/messages_screen.dart';
import 'package:itienda/Views/ProfileScreens/help_center_screen.dart';
import 'package:itienda/Views/ProfileScreens/notification_screen.dart';
import 'package:itienda/Views/ProfileScreens/edit_profile_screen.dart';
import 'package:itienda/Views/ProfileScreens/term_condition_screen.dart';
import 'package:itienda/Views/ProfileScreens/privacy_policy_screen.dart';
import 'package:itienda/Views/ProfileScreens/my_job_application_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> name = <String>[
    "Editar Mi Perfil",
    "Mis Postulaciones",
    "Mensajes",
    "Notificaciones",
    "Central de Ayuda",
    "Política de Privacidad",
    "Términos y Condiciones",
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/profile.jpg"), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: width * 0.08, top: 65),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 106,
                      child: Image.asset(
                        "assets/itienda.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: height * 0.08, left: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            container(context, () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EditProfileScreen(),
                                ),
                              );
                            },
                                text1: "Editar Mi Perfil",
                                image: 'assets/11.png'),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MyApplicationsJobSeekerScreen(),
                                  ));
                            },
                                text1: "Mis Postulaciones",
                                image: 'assets/12.png'),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MessagesScreen(),
                                    ));
                              },
                              child: Container(
                                height: 40,
                                width: width * 0.9,
                                margin: EdgeInsets.only(bottom: height * 0.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Image.asset(
                                      "assets/13.png",
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    const Text(
                                      "Mensajes",
                                      style: TextStyle(
                                          color: AppColors.textWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Montserrat"),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    badges.Badge(
                                      showBadge: true,
                                      onTap: () {},
                                      badgeContent: const Text(
                                        "1",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      badgeAnimation:
                                          const badges.BadgeAnimation.rotation(
                                        animationDuration: Duration(seconds: 1),
                                        colorChangeAnimationDuration:
                                            Duration(seconds: 1),
                                        loopAnimation: false,
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                      badgeStyle: badges.BadgeStyle(
                                        shape: badges.BadgeShape.circle,
                                        badgeColor: Colors.red,
                                        padding: const EdgeInsets.all(5),
                                        borderRadius: BorderRadius.circular(4),
                                        elevation: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationsScreen(),
                                    ));
                              },
                              child: Container(
                                height: 40,
                                width: width * 0.9,
                                margin: EdgeInsets.only(bottom: height * 0.01),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFFFFFFFF),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    Image.asset(
                                      "assets/14.png",
                                      height: 25,
                                      width: 25,
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    const Text(
                                      "Notificaciones",
                                      style: TextStyle(
                                          color: AppColors.textWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Montserrat"),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    badges.Badge(
                                      showBadge: true,
                                      onTap: () {},
                                      badgeContent: const Text(
                                        "1",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      badgeAnimation:
                                          const badges.BadgeAnimation.rotation(
                                        animationDuration: Duration(seconds: 1),
                                        colorChangeAnimationDuration:
                                            Duration(seconds: 1),
                                        loopAnimation: false,
                                        curve: Curves.fastOutSlowIn,
                                      ),
                                      badgeStyle: badges.BadgeStyle(
                                        shape: badges.BadgeShape.circle,
                                        badgeColor: Colors.red,
                                        padding: const EdgeInsets.all(5),
                                        borderRadius: BorderRadius.circular(4),
                                        elevation: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HelpCentreScreen(),
                                  ));
                            },
                                text1: "Central de Ayuda",
                                image: 'assets/15.png'),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPolicyScreen(),
                                  ));
                            },
                                text1: "Política de Privacidad",
                                image: 'assets/16.png'),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsConditionsScreen(),
                                  ));
                            },
                                text1: "Términos y Condiciones",
                                image: 'assets/17.png'),
                          ],
                        )),
                  ]),
            )),
      ),
    );
  }
}
