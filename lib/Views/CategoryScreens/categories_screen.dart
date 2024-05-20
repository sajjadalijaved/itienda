import 'package:flutter/material.dart';
import 'package:itienda/Utils/appcolors.dart';
import 'package:itienda/Views/CategoryScreens/job_listing_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<dynamic> jobs = [
    {'image': 'assets/1.png', 'title': 'Administrativo', 'vacancies': 5},
    {
      'image': 'assets/service.png',
      'title': 'Atención al Cliente',
      'vacancies': 3
    },
    {'image': 'assets/pl.png', 'title': 'Construcción', 'vacancies': 4},
    {'image': 'assets/shef.png', 'title': 'Gastronomía', 'vacancies': 2},
    {'image': 'assets/2.png', 'title': 'Mantenimiento', 'vacancies': 6},
    {'image': 'assets/3.png', 'title': 'Salud', 'vacancies': 6},
    {'image': 'assets/4.png', 'title': 'Seguridad', 'vacancies': 6},
    {'image': 'assets/5.png', 'title': 'Servicios', 'vacancies': 6},
    {'image': 'assets/6.png', 'title': 'Tecnología', 'vacancies': 6},
    {'image': 'assets/7.png', 'title': 'Ventas', 'vacancies': 6},
    {'image': 'assets/8.png', 'title': 'Otros', 'vacancies': 6},
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
                image: AssetImage("assets/edit.png"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 22,
              top: height * 0.05,
              right: width * 0.05,
            ),
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
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/category.png",
                        height: 20,
                        width: 20,
                        color: AppColors.textWhiteColor,
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      const FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Selecciona una Categoría",
                          style: TextStyle(
                              color: AppColors.textWhiteColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              fontFamily: "Montserrat"),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.10,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * .7,
                  width: width,
                  child: ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      JobListingJobSeekerScreen(
                                    name: jobs[index]['title'].toString(),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: 40,
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
                                    jobs[index]['image'],
                                    height: 25,
                                    width: 25,
                                  ),
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      jobs[index]['title'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Montserrat",
                                          color: AppColors.textWhiteColor),
                                    ),
                                  ),
                                  const Spacer(),
                                  FittedBox(
                                    fit: BoxFit.contain,
                                    child: Text(
                                      "${jobs[index]['vacancies']}  vacantes",
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Montserrat",
                                          color: AppColors.textWhiteColor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.03,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
