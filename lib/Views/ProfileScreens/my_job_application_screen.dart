import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Widgets/text_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class MyApplicationsJobSeekerScreen extends StatefulWidget {
  const MyApplicationsJobSeekerScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApplicationsJobSeekerScreen> createState() =>
      _MyApplicationsJobSeekerScreenState();
}

class _MyApplicationsJobSeekerScreenState
    extends State<MyApplicationsJobSeekerScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: height * 0.02,
          ),
          height: height,
          width: width,
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  "assets/back.png",
                ),
                alignment: Alignment.bottomRight,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.06),
                child: SizedBox(
                  height: height * 0.05,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: AppColors.buttonColor,
                        ),
                      ),
                      const Text(
                        "Regresar",
                        style: TextStyle(
                            color: AppColors.appbarTitleColor,
                            fontSize: 20,
                            fontFamily: "Montserrat"),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.056,
                ),
                child: SizedBox(
                  height: height * 0.09,
                  width: 182,
                  child: Image.asset(
                    "assets/splash.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.122,
                ),
                child: SizedBox(
                  height: height * 0.05,
                  width: width,
                  child: Row(
                    children: [
                      Image.asset("assets/phone.png",
                          height: height * 0.102, width: width * 0.102),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      text("Mis Postulaciones", 18, fontWeight: FontWeight.bold)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: width * 0.040,
                      right: width * 0.040,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    width: width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF365830),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            text("Auxiliar Administrativo(a)", 16),
                            const Spacer(),
                            Container(
                              margin: EdgeInsets.only(right: width * 0.02),
                              width: width * 0.216,
                              // height: height * 0.05,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF0000),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Aplicado en",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat"),
                                  ),
                                  Text(
                                    "09-01-2024",
                                    style: TextStyle(
                                        color: Color(0xFFFFFFFF),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.03,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Company Name Sample",
                                style: TextStyle(
                                    color: Color(0xFF3E34B5),
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    fontSize: 14,
                                    fontFamily: "Montserrat"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.04),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/pin.png",
                                      height: height * 0.02,
                                    ),
                                    const Text(
                                      "Puerto Vallarta,Jalisco",
                                      style: TextStyle(
                                          color: Color(0xFF333333),
                                          fontSize: 10,
                                          fontFamily: "Montserrat"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.001,
                        ),
                        SizedBox(
                          width: width,
                          child: text(
                              "Here is the space that we will save for the job description. 208 caracters including spaces.  Here is the space that we will save for the job description.208 caracters including spaces.  Here is the spa.",
                              12),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.watch_later_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: width * 0.01,
                                ),
                                SizedBox(
                                  width: width * 0.45,
                                  child: text(
                                      "Lunes a Sábado.9am - 6pm.Con 1h de intervalo.",
                                      12),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // height: height * 0.06,
                                    // width: width * 0.06,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: const Center(
                                      child: Icon(
                                        FontAwesomeIcons.dollarSign,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  SizedBox(
                                    width: width * 0.22,
                                    child: const Text(
                                      "\$8,000 más bonificaciones",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textBlackColor,
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
