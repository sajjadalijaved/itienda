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
    "Atencion al Cliente",
    "Gastronomy",
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: width * 0.05,
              top: height * 0.05,
              right: width * 0.05,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.10,
                  width: width * 0.5,
                  child: Image.asset(
                    "assets/splash.png",
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                  height: height * 0.05,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF2F2F2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(
                          0.5,
                          2.0,
                        ),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                    ],
                    border: Border.all(
                      color: const Color(0xFF000000),
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar Empleo',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: "Montserrat"),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.08, top: height * 0.004),
                  child: SizedBox(
                    height: height * 0.02,
                    child: const Text(
                      "Puesto, palabra-clabe o empresa",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.07,
                  ),
                  child: SizedBox(
                    height: height * 0.03,
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/pin.png",
                          height: height * 0.03,
                        ),
                        const Text(
                          "Puerto Vallarta, Jalisco, Mexico",
                          style: TextStyle(
                              color: Color(0xFF333333),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.005,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: width * 0.09,
                  ),
                  child: SizedBox(
                    height: height * 0.03,
                    child: const Text(
                      "(incluye Cabo Corrientes y Bahia Banderas)",
                      style: TextStyle(
                          color: Color(0xFF333333),
                          fontSize: 12,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Container(
                  height: height * 0.10,
                  width: width,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ho.png"), fit: BoxFit.fill),
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
                        Text(
                          "‌¿Mejores Resultados?",
                          style: TextStyle(
                              color: AppColors.textWhiteColor,
                              fontSize: 14,
                              fontFamily: "Montserrat"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Actualizar perfil",
                              style: TextStyle(
                                  color: AppColors.textWhiteColor,
                                  fontSize: 10,
                                  fontFamily: "Montserrat"),
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
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(right: width * 0.03),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Categorías",
                        style: TextStyle(
                            color: AppColors.textBlackColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"),
                      ),
                      Text(
                        "Ver Todas",
                        style: TextStyle(
                            color: AppColors.textBlackColor,
                            fontSize: 14,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.15,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) => Container(
                      padding: EdgeInsets.only(
                          right: width * 0.03,
                          top: height * 0.01,
                          left: width * 0.03),
                      margin: EdgeInsets.only(right: width * 0.06),
                      height: height * 0.20,
                      width: width * 0.26,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(.09),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(images[index]),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Center(
                            child: Text(
                              categoryName[index],
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
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
    );
  }
}
