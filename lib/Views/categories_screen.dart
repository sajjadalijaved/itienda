import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<String> name = <String>[
    "Administrativo",
    "Atención al Cliente",
    "Construcción",
    "Gastronomía",
    "Mantenimiento",
    "Salud",
    "Seguridad",
    "Servicios",
    "Tecnología",
    "Ventas",
    "Otros",
  ];
  List<String> number = <String>[
    "4",
    "19",
    "11",
    "23",
    "7",
    "3",
    "5",
    "9",
    "3",
    "8",
    "4",
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
              left: width * 0.08,
              top: height * 0.08,
              right: width * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.09,
                  width: width * 0.6,
                  child: Image.asset(
                    "assets/splash.png",
                    height: height * 0.09,
                    width: width * 0.6,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.05,
                  ),
                  child: SizedBox(
                    height: height * 0.05,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/category.png",
                          height: height * 0.04,
                          color: Colors.black,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        const Text(
                          "Selecciona una Categoría",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontSize: 18,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.08, horizontal: width * 0.05),
                  child: ListView(
                    shrinkWrap: true,
                    children: List.generate(
                        name.length,
                        (index) => Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.04,
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
                                      const Spacer(),
                                      Text(
                                        "${number[index]}  vacantes",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Montserrat",
                                            color: Color(0xFF006341)),
                                      ),
                                      SizedBox(
                                        width: width * 0.03,
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
