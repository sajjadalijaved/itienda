import 'package:flutter/material.dart';
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
            width: width,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/back.png"),
                  alignment: Alignment.bottomRight),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: width * 0.08, right: width * 0.05, top: height * 0.08),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.09,
                      width: width * 0.6,
                      child: Image.asset(
                        "assets/splash.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.12, left: width * 0.08),
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
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MessagesScreen(),
                                  ));
                            }, "Mensajes"),
                            container(context, () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationsScreen(),
                                  ));
                            }, "Notificaciones"),
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