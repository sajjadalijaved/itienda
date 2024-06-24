import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

class HomeScreenBusinessOwner extends StatefulWidget {
  String businessName;
  HomeScreenBusinessOwner({
    Key? key,
    required this.businessName,
  }) : super(key: key);

  @override
  State<HomeScreenBusinessOwner> createState() =>
      _HomeScreenBusinessOwnerState();
}

class _HomeScreenBusinessOwnerState extends State<HomeScreenBusinessOwner> {
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage("assets/images/ownerside.jpg"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              top: height * 0.06,
              right: width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/businessside.png",
                  height: 73,
                  width: 182,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: const Text(
                    "Bievenido(a)!",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Montserrat"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.05),
                  child: Text(
                    widget.businessName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Colors.white,
                        fontFamily: "Montserrat"),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/add.png",
                        height: 30,
                        width: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Registrar mi Negocio",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.10),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/add.png",
                        height: 30,
                        width: 30,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Agregar Vacante",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.10,
                ),
                Container(
                  margin: EdgeInsets.only(left: width * 0.05),
                  height: 109,
                  width: width,
                  padding: EdgeInsets.only(left: width * 0.05),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ho.png"), fit: BoxFit.fill),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "‌‌¿Buscas Mejores Candidatos?",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
