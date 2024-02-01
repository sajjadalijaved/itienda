import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
            height: height,
            width: width - 2,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/back.png"),
                  alignment: Alignment.bottomRight),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 22, right: width * 0.08, top: 76),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.09,
                      width: 182,
                      child: Image.asset(
                        "assets/splash.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: height * 0.10, left: 17),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditProfileScreen(),
                                  ));
                            }, "Editar Mi Perfil"),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MyApplicationsJobSeekerScreen(),
                                  ));
                            }, "Mis Postulaciones"),
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
                                height: height * 0.04,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFF365830),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_outlined,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    text("Mensajes", 16),
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
                                height: height * 0.04,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 0.5,
                                    color: const Color(0xFF365830),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: width * 0.01,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_outlined,
                                      size: 25,
                                    ),
                                    SizedBox(
                                      width: width * 0.03,
                                    ),
                                    text("Notificaciones", 16),
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
                            }, "Central de Ayuda"),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPolicyScreen(),
                                  ));
                            }, "Política de Privacidad"),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsConditionsScreen(),
                                  ));
                            }, "Términos y Condiciones"),
                          ],
                        )),
                  ]),
            )),
      ),
    );
  }
}
