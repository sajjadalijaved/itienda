import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Widgets/text_widget.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class HelpCentreScreen extends StatefulWidget {
  const HelpCentreScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HelpCentreScreen> createState() => _HelpCentreScreenState();
}

class _HelpCentreScreenState extends State<HelpCentreScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: height * 0.03,
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
              padding: EdgeInsets.only(left: width * 0.07),
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
                left: width * 0.06,
              ),
              child: SizedBox(
                height: height * 0.09,
                width: width * 0.6,
                child: Image.asset(
                  "assets/splash.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.20,
              ),
              child: SizedBox(
                height: height * 0.06,
                width: width,
                child: Row(
                  children: [
                    Image.asset("assets/help.png"),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    text("Central de Ayuda", 18, fontWeight: FontWeight.bold)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.18, right: width * 0.06),
              child: SizedBox(
                  height: height * 0.05,
                  width: width,
                  child: text(
                    "Entra en contacto con nostros por uno de los medios disponibles.",
                    16,
                  )),
            ),
            SizedBox(
              height: height * 0.10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.10),
              height: height * 0.20,
              width: width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/pro.png"), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "+52 (322) 308-0150",
                    style: TextStyle(
                        color: AppColors.regisgerColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  const Text(
                    "info@itiendamexico.com",
                    style: TextStyle(
                        color: AppColors.regisgerColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
