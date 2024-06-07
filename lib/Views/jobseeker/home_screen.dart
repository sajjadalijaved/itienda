import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;

  List<String> categoryName = <String>[
    "Atencion    al Cliente",
    "Gastronomia",
    "Construction",
  ];
  List<String> images = <String>[
    "assets/service.png",
    "assets/shef.png",
    "assets/pl.png",
  ];
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage("assets/back.png"), fit: BoxFit.fill)),
            child: Padding(
              padding: EdgeInsets.only(
                left: 22,
                top: height * 0.06,
                right: width * 0.04,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/itienda.png",
                    height: 40,
                    width: 106,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: width * 0.038, top: 8),
                    margin: EdgeInsets.only(right: width * 0.06),
                    height: height * 0.06,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFFF2F2F2),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(
                            0.5,
                            2.0,
                          ),
                          blurRadius: 2.0,
                          spreadRadius: 1.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: 'Buscar Empleo',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: "Montserrat"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.06, top: height * 0.008),
                    child: const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Puesto, palabra-clabe o empresa",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w200,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.07,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/pin.png",
                          height: 17,
                          width: 17,
                          color: AppColors.textWhiteColor,
                        ),
                        const FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "Puerto Vallarta, Jalisco, Mexico",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Montserrat"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * 0.09,
                    ),
                    child: const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "incluye Cabo Corrientes y Bahia Banderas",
                        style: TextStyle(
                            color: AppColors.textWhiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.14,
                  ),

                  // SizedBox(
                  //   height: height * 0.05,
                  // ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Categorías",
                        style: TextStyle(
                            color: AppColors.textWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat"),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        "Ver Todas",
                        style: TextStyle(
                            color: AppColors.textWhiteColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textWhiteColor,
                            decorationThickness: 2,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.2,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(
                          top: height * 0.01,
                        ),
                        margin: EdgeInsets.only(right: width * 0.12),
                        width: width * 0.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                categoryName[index],
                                style: const TextStyle(
                                    color: AppColors.textWhiteColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Montserrat"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 78,
                      width: 248,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/ho.png"),
                            fit: BoxFit.fill),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "‌¿Mejores Resultados?",
                                style: TextStyle(
                                    color: AppColors.textWhiteColor,
                                    fontSize: 14,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Text(
                                    "Actualizar perfil",
                                    style: TextStyle(
                                        color: AppColors.textWhiteColor,
                                        fontSize: 10,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 15,
                                  color: Color(0xFFFFFFFF),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
