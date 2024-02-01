import '../../Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:itienda/Widgets/text_widget.dart';

// ignore_for_file: must_be_immutable

// ignore_for_file: public_member_api_docs, sort_constructors_first

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
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
                height: height * 0.06,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: width * 0.124,
                ),
                child: SizedBox(
                  height: height * 0.06,
                  width: width,
                  child: Row(
                    children: [
                      Image.asset("assets/term.png"),
                      SizedBox(
                        width: width * 0.02,
                      ),
                      text("Términos y Condiciones", 18,
                          fontWeight: FontWeight.bold)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
