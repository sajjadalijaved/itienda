import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';

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
                  padding:
                      EdgeInsets.only(top: height * 0.12, left: width * 0.08),
                  child: ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        name.length,
                        (index) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.04,
                                  width: width * 0.7,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 0.05,
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
                                      Text(
                                        name[index],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Montserrat",
                                            color: AppColors.textBlackColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
